// Upload Service - Supabase Image Upload

import 'dart:typed_data';
import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../network/dio_client.dart';
import '../storage/token_storage.dart';

class UploadService {
  UploadService._();

  static final instance = UploadService._();

  Dio get _dio => DioClient.instance.dio;

  Future<String> uploadImage(Uint8List bytes, {String prefix = 'avatars', String fileName = 'image'}) async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filePath = '$prefix/${timestamp}_$fileName';

      final token = await TokenStorage.instance.getAccessToken();
      final url = '${AppConfig.supabaseUrl}/storage/v1/object/images/$filePath';

      await _dio.put(
        url,
        data: Stream.fromIterable([bytes]),
        options: Options(
          headers: {
            'Content-Type': 'application/octet-stream',
            'Authorization': 'Bearer $token',
            'apikey': AppConfig.supabaseAnonKey,
          },
          contentType: 'application/octet-stream',
        ),
      );

      return '${AppConfig.supabaseUrl}/storage/v1/object/public/images/$filePath';
    } catch (e) {
      rethrow;
    }
  }
}
