// Message Model

import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'sender_type') required SenderType senderType,
    @JsonKey(name: 'character_id') String? characterId,
    MessageCharacter? character,
    required String content,
    @JsonKey(name: 'media_url') String? mediaUrl,
    @JsonKey(name: 'audio_url') String? audioUrl,
    @JsonKey(name: 'token_count') @Default(0) int tokenCount,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@freezed
abstract class MessageCharacter with _$MessageCharacter {
  const factory MessageCharacter({
    required String id,
    required String name,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'voice_id') String? voiceId,
  }) = _MessageCharacter;

  factory MessageCharacter.fromJson(Map<String, dynamic> json) =>
      _$MessageCharacterFromJson(json);
}
