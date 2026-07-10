// Group Service - Group Chat

import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../shared/models/index.dart';

class GroupService {
  GroupService._();

  static final instance = GroupService._();

  Dio get _dio => DioClient.instance.dio;

  Future<Conversation> createGroup(List<String> characterIds) async {
    try {
      final response = await _dio.post(
        '/groups',
        data: {'character_ids': characterIds},
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return Conversation.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Character>> getGroupCharacters(String groupId) async {
    try {
      final response = await _dio.get('/groups/$groupId/characters');
      final data = response.data['data'] as List;
      return data.map((e) => Character.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addCharacter(String groupId, String characterId) async {
    try {
      await _dio.post(
        '/groups/$groupId/characters',
        data: {'character_id': characterId},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeCharacter(String groupId, String characterId) async {
    try {
      await _dio.delete('/groups/$groupId/characters/$characterId');
    } catch (e) {
      rethrow;
    }
  }

  Future<GroupMessageResponse> sendMessage(String groupId, String content) async {
    try {
      final response = await _dio.post(
        '/groups/$groupId/messages',
        data: {'content': content},
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return GroupMessageResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}

