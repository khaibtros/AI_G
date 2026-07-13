// Authentication Service

import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../core/storage/token_storage.dart';
import '../../shared/models/index.dart';
import 'i_auth_service.dart';

class AuthService implements IAuthService {
  AuthService._();

  static final instance = AuthService._();

  Dio get _dio => DioClient.instance.dio;

  @override
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String username,
    String? displayName,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {
          'email': email,
          'password': password,
          'username': username,
          'display_name': displayName,
        },
      );

      final data = response.data['data'] as Map<String, dynamic>;
      final authResponse = AuthResponse.fromJson(data);
      await _saveTokens(authResponse.accessToken, authResponse.refreshToken);
      return authResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      final data = response.data['data'] as Map<String, dynamic>;
      final authResponse = AuthResponse.fromJson(data);
      await _saveTokens(authResponse.accessToken, authResponse.refreshToken);
      return authResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await TokenStorage.instance.clearTokens();
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _dio.post('/auth/forgot-password', data: {'email': email});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Profile> getProfile() async {
    try {
      final response = await _dio.get('/user/profile');
      final data = response.data['data'] as Map<String, dynamic>;
      return Profile.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Profile> updateProfile({String? displayName, String? bio}) async {
    try {
      final response = await _dio.put(
        '/user/profile',
        data: {'display_name': displayName, 'bio': bio},
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return Profile.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> hasToken() async {
    final token = await TokenStorage.instance.getAccessToken();
    return token != null;
  }

  Future<void> _saveTokens(String accessToken, String refreshToken) async {
    await TokenStorage.instance.setAccessToken(accessToken);
    await TokenStorage.instance.setRefreshToken(refreshToken);
  }
}
