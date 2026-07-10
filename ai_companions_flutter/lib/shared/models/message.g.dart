// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: json['id'] as String,
  conversationId: json['conversation_id'] as String,
  senderType: $enumDecode(_$SenderTypeEnumMap, json['sender_type']),
  characterId: json['character_id'] as String?,
  character: json['character'] == null
      ? null
      : MessageCharacter.fromJson(json['character'] as Map<String, dynamic>),
  content: json['content'] as String,
  mediaUrl: json['media_url'] as String?,
  audioUrl: json['audio_url'] as String?,
  tokenCount: (json['token_count'] as num?)?.toInt() ?? 0,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'conversation_id': instance.conversationId,
  'sender_type': _$SenderTypeEnumMap[instance.senderType]!,
  'character_id': instance.characterId,
  'character': instance.character,
  'content': instance.content,
  'media_url': instance.mediaUrl,
  'audio_url': instance.audioUrl,
  'token_count': instance.tokenCount,
  'created_at': instance.createdAt,
};

const _$SenderTypeEnumMap = {
  SenderType.user: 'user',
  SenderType.character: 'character',
  SenderType.system: 'system',
};

_MessageCharacter _$MessageCharacterFromJson(Map<String, dynamic> json) =>
    _MessageCharacter(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      voiceId: json['voice_id'] as String?,
    );

Map<String, dynamic> _$MessageCharacterToJson(_MessageCharacter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'voice_id': instance.voiceId,
    };
