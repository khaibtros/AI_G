// Character Service

import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../shared/models/index.dart';

class CharacterService {
  CharacterService._();

  static final instance = CharacterService._();

  Dio get _dio => DioClient.instance.dio;

  Future<PaginatedResponse<Character>> list({
    int? page,
    int? limit,
    String? gender,
    String? style,
    String? category,
    String? sort,
    String? search,
    bool? isNsfw,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        if (page != null) 'page': page,
        if (limit != null) 'limit': limit,
        if (gender != null && gender.isNotEmpty) 'gender': gender,
        if (style != null && style.isNotEmpty) 'style': style,
        if (category != null && category.isNotEmpty) 'category': category,
        if (sort != null && sort.isNotEmpty) 'sort': sort,
        if (search != null && search.isNotEmpty) 'search': search,
        if (isNsfw != null) 'is_nsfw': isNsfw,
      };

      final response = await _dio.get(
        '/characters',
        queryParameters: queryParams,
      );

      return PaginatedResponse.fromJson(
        response.data as Map<String, dynamic>,
        (json) => Character.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Character> getById(String id) async {
    try {
      final response = await _dio.get('/characters/$id');
      final data = response.data['data'] as Map<String, dynamic>;
      return Character.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Character> create(CreateCharacterRequest request) async {
    try {
      final json = request.toJson();
      json.removeWhere((key, value) => value == null);
      final response = await _dio.post('/characters', data: json);
      final data = response.data['data'] as Map<String, dynamic>;
      return Character.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Character> update(String id, UpdateCharacterRequest request) async {
    try {
      final json = request.toJson();
      json.removeWhere((key, value) => value == null);
      final response = await _dio.put(
        '/characters/$id',
        data: json,
      );
      final data = response.data['data'] as Map<String, dynamic>;
      return Character.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String id) async {
    try {
      await _dio.delete('/characters/$id');
    } catch (e) {
      rethrow;
    }
  }

  Future<FavoriteResponse> toggleFavorite(String id) async {
    try {
      final response = await _dio.post('/characters/$id/favorite');
      final data = response.data['data'] as Map<String, dynamic>;
      return FavoriteResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Character>> getMyCharacters() async {
    try {
      final response = await _dio.get('/characters/me');
      final data = response.data['data'] as List;
      return data
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Character>> getFavorites() async {
    try {
      final response = await _dio.get('/user/favorites');
      final data = response.data['data'] as List;
      return data
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
