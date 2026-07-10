import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_companions_flutter/core/services/user_service.dart';
import 'package:ai_companions_flutter/features/auth/providers/auth_provider.dart';

class UserState {
  final bool isLoading;
  final String? error;

  UserState({this.isLoading = false, this.error});

  UserState copyWith({bool? isLoading, String? error}) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class UserNotifier extends Notifier<UserState> {
  @override
  UserState build() => UserState();

  Future<void> updateProfile({String? displayName, String? username}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final request = UpdateProfileRequest(
        displayName: displayName,
        username: username,
      );
      final updatedUser = await UserService.instance.updateProfile(request);
      ref.read(authProvider.notifier).updateUser(updatedUser);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final request = ChangePasswordRequest(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      await UserService.instance.changePassword(request);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }
}

final userProvider = NotifierProvider<UserNotifier, UserState>(
  UserNotifier.new,
);
