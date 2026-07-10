// Upload Service - Supabase Image Upload

import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadService {
  UploadService._();

  static final instance = UploadService._();

  Future<String> uploadImage(File file, {String prefix = 'avatars'}) async {
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';
      final filePath = '$prefix/$fileName';

      final bytes = await file.readAsBytes();
      await Supabase.instance.client.storage
          .from('images')
          .uploadBinary(filePath, bytes, fileOptions: const FileOptions(upsert: false));

      final publicUrl = Supabase.instance.client.storage
          .from('images')
          .getPublicUrl(filePath);

      return publicUrl;
    } catch (e) {
      rethrow;
    }
  }
}
