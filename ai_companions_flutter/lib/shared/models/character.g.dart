// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Character _$CharacterFromJson(Map<String, dynamic> json) => _Character(
  id: json['id'] as String,
  name: json['name'] as String,
  tagline: json['tagline'] as String?,
  description: json['description'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  bannerUrl: json['banner_url'] as String?,
  style:
      $enumDecodeNullable(_$CharacterStyleEnumMap, json['style']) ??
      CharacterStyle.anime,
  gender:
      $enumDecodeNullable(_$CharacterGenderEnumMap, json['gender']) ??
      CharacterGender.female,
  appearance: json['appearance'] == null
      ? const CharacterAppearance()
      : CharacterAppearance.fromJson(
          json['appearance'] as Map<String, dynamic>,
        ),
  personality: json['personality'] == null
      ? const CharacterPersonality()
      : CharacterPersonality.fromJson(
          json['personality'] as Map<String, dynamic>,
        ),
  systemPrompt: json['system_prompt'] as String?,
  greetingMessage: json['greeting_message'] as String? ?? '',
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  chatCount: (json['chat_count'] as num?)?.toInt() ?? 0,
  favoriteCount: (json['favorite_count'] as num?)?.toInt() ?? 0,
  isPublic: json['is_public'] as bool? ?? true,
  isOfficial: json['is_official'] as bool? ?? false,
  isNsfw: json['is_nsfw'] as bool? ?? false,
  creatorId: json['creator_id'] as String?,
  createdAt: json['created_at'] as String? ?? '',
  updatedAt: json['updated_at'] as String? ?? '',
  isFavorited: json['is_favorited'] as bool?,
  voiceId: json['voice_id'] as String?,
);

Map<String, dynamic> _$CharacterToJson(_Character instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tagline': instance.tagline,
      'description': instance.description,
      'avatar_url': instance.avatarUrl,
      'banner_url': instance.bannerUrl,
      'style': _$CharacterStyleEnumMap[instance.style]!,
      'gender': _$CharacterGenderEnumMap[instance.gender]!,
      'appearance': instance.appearance,
      'personality': instance.personality,
      'system_prompt': instance.systemPrompt,
      'greeting_message': instance.greetingMessage,
      'categories': instance.categories,
      'chat_count': instance.chatCount,
      'favorite_count': instance.favoriteCount,
      'is_public': instance.isPublic,
      'is_official': instance.isOfficial,
      'is_nsfw': instance.isNsfw,
      'creator_id': instance.creatorId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_favorited': instance.isFavorited,
      'voice_id': instance.voiceId,
    };

const _$CharacterStyleEnumMap = {
  CharacterStyle.anime: 'anime',
  CharacterStyle.realistic: 'realistic',
  CharacterStyle.cartoon: 'cartoon',
  CharacterStyle.threeD: '3d',
  CharacterStyle.pixel: 'pixel',
};

const _$CharacterGenderEnumMap = {
  CharacterGender.male: 'male',
  CharacterGender.female: 'female',
  CharacterGender.nonBinary: 'non-binary',
  CharacterGender.other: 'other',
};
