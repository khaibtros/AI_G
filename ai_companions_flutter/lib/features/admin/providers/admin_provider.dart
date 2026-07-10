import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';
import '../../../shared/models/profile.dart';
import '../../../shared/models/character.dart';

class AdminState {
  final List<Profile> users;
  final int totalUsers;
  final int totalCharacters;
  final List<Character> characters;
  final bool isLoading;

  AdminState({
    this.users = const [],
    this.totalUsers = 0,
    this.totalCharacters = 0,
    this.characters = const [],
    this.isLoading = false,
  });

  AdminState copyWith({
    List<Profile>? users,
    int? totalUsers,
    int? totalCharacters,
    List<Character>? characters,
    bool? isLoading,
  }) {
    return AdminState(
      users: users ?? this.users,
      totalUsers: totalUsers ?? this.totalUsers,
      totalCharacters: totalCharacters ?? this.totalCharacters,
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AdminNotifier extends Notifier<AdminState> {
  @override
  AdminState build() => AdminState();

  final Dio _dio = DioClient.instance.dio;

  Future<void> fetchUsers() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _dio.get('/admin/users');
      final data = response.data['data'] as List;
      final users = data.map((e) => Profile.fromJson(e)).toList();
      state = state.copyWith(users: users, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> banUser(String userId) async {
    try {
      await _dio.delete('/admin/users/$userId');
      state = state.copyWith(
        users: state.users.where((u) => u.id != userId).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchStats() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _dio.get('/admin/stats');
      final data = response.data['data'];
      state = state.copyWith(
        totalUsers: data['users'] ?? 0,
        totalCharacters: data['characters'] ?? 0,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> fetchCharacters() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _dio.get('/admin/characters');
      final data = response.data['data'] as List;
      final characters = data.map((e) => Character.fromJson(e)).toList();
      state = state.copyWith(characters: characters, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> deleteCharacter(String characterId) async {
    try {
      await _dio.delete('/admin/characters/$characterId');
      state = state.copyWith(
        characters: state.characters.where((c) => c.id != characterId).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }
}

final adminProvider = NotifierProvider<AdminNotifier, AdminState>(
  AdminNotifier.new,
);
