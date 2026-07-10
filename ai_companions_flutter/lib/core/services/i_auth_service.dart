import '../../shared/models/index.dart';

abstract class IAuthService {
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String username,
    String? displayName,
  });

  Future<AuthResponse> login({required String email, required String password});

  Future<void> logout();

  Future<void> forgotPassword(String email);

  Future<Profile> getProfile();

  Future<Profile> updateProfile({String? displayName, String? bio});

  Future<bool> hasToken();
}
