// Dio HTTP Client with Interceptors
// Replicates React Native api.ts behavior with auth and refresh token logic

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../config/app_config.dart';
import '../storage/token_storage.dart';
import '../errors/app_exceptions.dart';
import '../utils/app_logger.dart';

class DioClient {
  DioClient._();

  static final DioClient instance = DioClient._();

  late final Dio _dio;

  Dio get dio => _dio;

  void initialize() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.add(_authInterceptor());
    _dio.interceptors.add(_errorInterceptor());
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }

  // Auth interceptor - attach token to requests
  Interceptor _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await TokenStorage.instance.getAccessToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    );
  }

  // Error interceptor - handle 401 and refresh token
  Interceptor _errorInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          // Token expired - try refresh
          try {
            final refreshToken = await TokenStorage.instance.getRefreshToken();
            if (refreshToken != null) {
              // Create a new dio instance without interceptors to avoid infinite loop
              final refreshDio = Dio(BaseOptions(baseUrl: AppConfig.apiBaseUrl));

              final response = await refreshDio.post(
                '/auth/refresh',
                data: {'refresh_token': refreshToken},
              );

              if (response.data['success'] == true) {
                final accessToken = response.data['data']['access_token'];
                final newRefreshToken = response.data['data']['refresh_token'];

                await TokenStorage.instance.setAccessToken(accessToken);
                await TokenStorage.instance.setRefreshToken(newRefreshToken);

                // Retry original request with new token
                final options = error.requestOptions;
                options.headers['Authorization'] = 'Bearer $accessToken';

                final retryResponse = await _dio.fetch(options);
                return handler.resolve(retryResponse);
              }
            }
          } catch (e) {
            // Refresh failed - clear tokens
            await TokenStorage.instance.clearTokens();
            AppLogger.error('Token refresh failed', e);
          }
        }

        // Convert DioException to AppException
        handler.next(_handleDioError(error));
      },
    );
  }

  DioException _handleDioError(DioException error) {
    String message = 'An error occurred';

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'Connection timeout';
        break;
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final errorData = error.response?.data;

        if (errorData is Map && errorData.containsKey('error')) {
          message = errorData['error'];
        } else if (errorData is Map && errorData.containsKey('message')) {
          message = errorData['message'];
        } else {
          message = 'Server error: $statusCode';
        }
        break;
      case DioExceptionType.cancel:
        message = 'Request cancelled';
        break;
      case DioExceptionType.connectionError:
        message = 'No internet connection';
        break;
      case DioExceptionType.unknown:
        message = 'Network error';
        break;
      default:
        message = error.message ?? 'Unknown error';
    }

    return DioException(
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      error: AppException(message: message, originalError: error),
      message: message,
    );
  }
}
