// Native (mobile/desktop) implementation using flutter_secure_storage
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String?> secureRead(String key) async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: key);
}

Future<void> secureWrite(String key, String value) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: key, value: value);
}

Future<void> secureDelete(String key) async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: key);
}
