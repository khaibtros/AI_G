// Character Model

import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';
import 'character_appearance.dart';
import 'character_personality.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
abstract class Character with _$Character {
  const factory Character({
    required String id,
    required String name,
    String? tagline,
    String? description,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'banner_url') String? bannerUrl,
    @Default(CharacterStyle.anime) CharacterStyle style,
    @Default(CharacterGender.female) CharacterGender gender,
    @Default(CharacterAppearance()) CharacterAppearance appearance,
    @Default(CharacterPersonality()) CharacterPersonality personality,
    @JsonKey(name: 'system_prompt') String? systemPrompt,
    @JsonKey(name: 'greeting_message') @Default('') String greetingMessage,
    @Default([]) List<String> categories,
    @JsonKey(name: 'chat_count') @Default(0) int chatCount,
    @JsonKey(name: 'favorite_count') @Default(0) int favoriteCount,
    @JsonKey(name: 'is_public') @Default(true) bool isPublic,
    @JsonKey(name: 'is_official') @Default(false) bool isOfficial,
    @JsonKey(name: 'is_nsfw') @Default(false) bool isNsfw,
    @JsonKey(name: 'creator_id') String? creatorId,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'is_favorited') bool? isFavorited,
    @JsonKey(name: 'voice_id') String? voiceId,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
