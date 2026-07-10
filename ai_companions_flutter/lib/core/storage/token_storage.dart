// Token Storage Service - Cross-platform secure storage
// Mobile: flutter_secure_storage, Web: SharedPreferences fallback

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  TokenStorage._();

  static final TokenStorage instance = TokenStorage._();

  final _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  // Keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  // Get item - uses secure storage on mobile, SharedPreferences on web
  Future<String?> getItem(String key) async {
    try {
      if (kIsWeb) {
        final prefs = await SharedPreferences.getInstance();
        return prefs.getString(key);
      } else {
        return await _secureStorage.read(key: key);
      }
    } catch (e) {
      return null;
    }
  }

  // Set item
  Future<void> setItem(String key, String value) async {
    try {
      if (kIsWeb) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(key, value);
      } else {
        await _secureStorage.write(key: key, value: value);
      }
    } catch (e) {
      // Silently fail
    }
  }

  // Remove item
  Future<void> removeItem(String key) async {
    try {
      if (kIsWeb) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove(key);
      } else {
        await _secureStorage.delete(key: key);
      }
    } catch (e) {
      // Silently fail
    }
  }

  // Access token helpers
  Future<String?> getAccessToken() => getItem(_accessTokenKey);
  Future<void> setAccessToken(String token) => setItem(_accessTokenKey, token);
  Future<void> removeAccessToken() => removeItem(_accessTokenKey);

  // Refresh token helpers
  Future<String?> getRefreshToken() => getItem(_refreshTokenKey);
  Future<void> setRefreshToken(String token) =>
      setItem(_refreshTokenKey, token);
  Future<void> removeRefreshToken() => removeItem(_refreshTokenKey);

  // Clear all tokens
  Future<void> clearTokens() async {
    await removeAccessToken();
    await removeRefreshToken();
  }
}
