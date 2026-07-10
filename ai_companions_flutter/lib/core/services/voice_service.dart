// Voice Service - Text-to-Speech and Speech-to-Text

import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../shared/models/index.dart';

class VoiceService {
  VoiceService._();

  static final instance = VoiceService._();

  Dio get _dio => DioClient.instance.dio;

  Future<VoiceResponse> textToSpeech(String text, {String voice = 'nova'}) async {
    try {
      final response = await _dio.post(
        '/voice/tts',
        data: {'text': text, 'voice': voice},
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return VoiceResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> speechToText(String audioBase64, {String mimeType = 'audio/mpeg'}) async {
    try {
      final response = await _dio.post(
        '/voice/stt',
        data: {
          'audio_base64': audioBase64,
          'mime_type': mimeType,
        },
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return data['text'] as String;
    } catch (e) {
      rethrow;
    }
  }
}

