// Conversation Model

import 'package:freezed_annotation/freezed_annotation.dart';
import 'character.dart';
import 'memory_fact.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'character_id') required String characterId,
    @JsonKey(name: 'last_message_at') required String lastMessageAt,
    @JsonKey(name: 'last_message_preview') String? lastMessagePreview,
    @JsonKey(name: 'message_count') @Default(0) int messageCount,
    @JsonKey(name: 'memory_summary') String? memorySummary,
    @JsonKey(name: 'memory_facts') @Default([]) List<MemoryFact> memoryFacts,
    @JsonKey(name: 'is_group') @Default(false) bool isGroup,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    Character? character,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
