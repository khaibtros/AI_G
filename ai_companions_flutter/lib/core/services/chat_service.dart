// Chat Service with SSE Streaming Support

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../core/config/app_config.dart';
import '../../shared/models/index.dart';

class ChatService {
  ChatService._();

  static final instance = ChatService._();

  Dio get _dio => DioClient.instance.dio;

  Future<List<Conversation>> listConversations() async {
    try {
      final response = await _dio.get('/chat/conversations');
      final data = response.data['data'] as List;
      return data.map((e) => Conversation.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Conversation> createConversation(String characterId) async {
    try {
      final response = await _dio.post(
        '/chat/conversations',
        data: {'character_id': characterId},
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return Conversation.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ConversationData> getConversation(String id, {int page = 1, int limit = 50}) async {
    try {
      final response = await _dio.get(
        '/chat/conversations/$id',
        queryParameters: {'page': page, 'limit': limit},
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return ConversationData.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteConversation(String id) async {
    try {
      await _dio.delete('/chat/conversations/$id');
    } catch (e) {
      rethrow;
    }
  }

  Future<SendMessageResponse> sendMessage(String conversationId, String content) async {
    try {
      final response = await _dio.post(
        '/chat/conversations/$conversationId/messages',
        data: {'content': content},
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return SendMessageResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> streamMessage(
    String conversationId,
    String content, {
    required void Function(Message) onUserMessage,
    required void Function(String) onToken,
    required void Function(Message) onDone,
    required void Function(String) onError,
  }) async {
    try {
      final url = '${AppConfig.apiBaseUrl}/chat/conversations/$conversationId/stream';

      final response = await _dio.post<ResponseBody>(
        url,
        data: {'content': content},
        options: Options(
          responseType: ResponseType.stream,
          headers: {'Accept': 'text/event-stream'},
        ),
      );

      final completer = Completer<void>();
      String buffer = '';
      String currentEvent = '';

      response.data!.stream.listen(
        (data) {
          buffer += utf8.decode(data);
          final lines = buffer.split('\n');
          buffer = lines.last;

          for (int i = 0; i < lines.length - 1; i++) {
            final line = lines[i].trim();
            if (line.isEmpty) continue;

            if (line.startsWith('event: ')) {
              currentEvent = line.substring(7).trim();
            } else if (line.startsWith('data: ')) {
              final rawData = line.substring(6).trim();
              try {
                final json = jsonDecode(rawData);
                switch (currentEvent) {
                  case 'user_message':
                    onUserMessage(Message.fromJson(json));
                    break;
                  case 'token':
                    onToken(json['content'] ?? '');
                    break;
                  case 'done':
                    onDone(Message.fromJson(json));
                    break;
                  case 'error':
                    onError(json['error'] ?? 'Unknown error');
                    break;
                }
              } catch (e) {
                // Ignore JSON parse errors
              }
            }
          }
        },
        onDone: () => completer.complete(),
        onError: (e) {
          onError('Stream error');
          completer.completeError(e);
        },
      );

      await completer.future;
    } catch (e) {
      rethrow;
    }
  }

  Future<RegenerateResponse> regenerate(String conversationId) async {
    try {
      final response = await _dio.post('/chat/conversations/$conversationId/regenerate');
      final data = response.data['data'] as Map<String, dynamic>;
      return RegenerateResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<SendGiftResponse> sendGift(String conversationId, String giftId) async {
    try {
      final response = await _dio.post(
        '/chat/conversations/$conversationId/gift',
        data: {'gift_id': giftId},
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return SendGiftResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteMessage(String conversationId, String messageId) async {
    try {
      await _dio.delete('/chat/conversations/$conversationId/messages/$messageId');
    } catch (e) {
      rethrow;
    }
  }
}


