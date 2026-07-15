// Environment Configuration

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  AppConfig._();

  static String get apiBaseUrl =>
      dotenv.env['EXPO_PUBLIC_API_URL'] ?? 'http://localhost:3001/api/v1';

  static String get supabaseUrl =>
      dotenv.env['EXPO_PUBLIC_SUPABASE_URL'] ?? 'https://placeholder.supabase.co';

  static String get supabaseAnonKey =>
      dotenv.env['EXPO_PUBLIC_SUPABASE_ANON_KEY'] ?? 'placeholder';

  static String get serverBaseUrl {
    final url = apiBaseUrl;
    const suffix = '/api/v1';
    if (url.endsWith(suffix)) {
      return url.substring(0, url.length - suffix.length);
    }
    return url;
  }

  static String? resolveImageUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.startsWith('http://') || url.startsWith('https://')) return url;
    return '$serverBaseUrl$url';
  }

  static Future<void> initialize() async {
    await dotenv.load(fileName: '.env');
  }
}
