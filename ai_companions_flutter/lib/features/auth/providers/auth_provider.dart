// Auth Provider - Riverpod state management

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/i_auth_service.dart';
import '../../../core/utils/app_logger.dart';
import '../../../shared/models/index.dart';

class AuthState {
  final Profile? user;
  final bool isAuthenticated;
  final bool isLoading;
  final String? error;

  AuthState({
    this.user,
    this.isAuthenticated = false,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    Profile? user,
    bool? isAuthenticated,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => AuthState();

  IAuthService get _authService => AuthService.instance;

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _authService.login(email: email, password: password);
      state = AuthState(
        user: result.user,
        isAuthenticated: true,
        isLoading: false,
      );
    } catch (e) {
      final message = e.toString();
      state = state.copyWith(isLoading: false, error: message);
      rethrow;
    }
  }

  Future<void> register(
    String email,
    String password,
    String username, {
    String? displayName,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _authService.register(
        email: email,
        password: password,
        username: username,
        displayName: displayName,
      );
      state = AuthState(
        user: result.user,
        isAuthenticated: true,
        isLoading: false,
      );
    } catch (e) {
      final message = e.toString();
      state = state.copyWith(isLoading: false, error: message);
      rethrow;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    state = AuthState();
  }

  Future<void> loadProfile() async {
    try {
      final hasToken = await _authService.hasToken();
      if (hasToken) {
        final profile = await _authService.getProfile();
        state = AuthState(user: profile, isAuthenticated: true);
      }
    } catch (e) {
      AppLogger.error('Failed to load profile', e);
      state = AuthState();
    }
  }

  Future<Profile> saveProfile({String? displayName, String? bio}) async {
    try {
      final profile = await _authService.updateProfile(
        displayName: displayName,
        bio: bio,
      );
      state = state.copyWith(user: profile);
      return profile;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> checkAuth() async {
    state = state.copyWith(isLoading: true);
    try {
      final hasToken = await _authService.hasToken();
      if (hasToken) {
        await loadProfile();
      }
    } catch (e) {
      AppLogger.error('Auth check failed', e);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void updateBalance(int newBalance) {
    if (state.user != null) {
      state = state.copyWith(
        user: state.user!.copyWith(coinBalance: newBalance),
      );
    }
  }

  void updateUser(Profile user) {
    state = state.copyWith(user: user);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isAuthenticated;
});

final currentUserProvider = Provider<Profile?>((ref) {
  return ref.watch(authProvider).user;
});
