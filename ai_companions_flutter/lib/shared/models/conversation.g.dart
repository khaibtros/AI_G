// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      characterId: json['character_id'] as String,
      lastMessageAt: json['last_message_at'] as String,
      lastMessagePreview: json['last_message_preview'] as String?,
      messageCount: (json['message_count'] as num?)?.toInt() ?? 0,
      memorySummary: json['memory_summary'] as String?,
      memoryFacts:
          (json['memory_facts'] as List<dynamic>?)
              ?.map((e) => MemoryFact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isGroup: json['is_group'] as bool? ?? false,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      character: json['character'] == null
          ? null
          : Character.fromJson(json['character'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'character_id': instance.characterId,
      'last_message_at': instance.lastMessageAt,
      'last_message_preview': instance.lastMessagePreview,
      'message_count': instance.messageCount,
      'memory_summary': instance.memorySummary,
      'memory_facts': instance.memoryFacts,
      'is_group': instance.isGroup,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'character': instance.character,
    };
