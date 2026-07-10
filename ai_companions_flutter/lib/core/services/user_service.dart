import 'package:dio/dio.dart';
import 'package:ai_companions_flutter/core/network/dio_client.dart';
import 'package:ai_companions_flutter/shared/models/profile.dart';

class UpdateProfileRequest {
  final String? displayName;
  final String? username;

  UpdateProfileRequest({this.displayName, this.username});

  Map<String, dynamic> toJson() {
    return {'display_name': displayName, 'username': username}
      ..removeWhere((key, value) => value == null);
  }
}

class ChangePasswordRequest {
  final String currentPassword;
  final String newPassword;

  ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {'current_password': currentPassword, 'new_password': newPassword};
  }
}

class UserService {
  UserService._();

  static final instance = UserService._();

  Dio get _dio => DioClient.instance.dio;

  Future<Profile> updateProfile(UpdateProfileRequest request) async {
    try {
      final response = await _dio.patch('/user/me', data: request.toJson());
      final data = response.data['data'] as Map<String, dynamic>;
      return Profile.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> changePassword(ChangePasswordRequest request) async {
    try {
      await _dio.post('/user/change-password', data: request.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
