// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCharacterRequest _$CreateCharacterRequestFromJson(
  Map<String, dynamic> json,
) => _CreateCharacterRequest(
  name: json['name'] as String,
  tagline: json['tagline'] as String?,
  description: json['description'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  bannerUrl: json['banner_url'] as String?,
  style: json['style'] as String?,
  gender: json['gender'] as String?,
  appearance: json['appearance'] == null
      ? null
      : CharacterAppearance.fromJson(
          json['appearance'] as Map<String, dynamic>,
        ),
  personality: json['personality'] == null
      ? null
      : CharacterPersonality.fromJson(
          json['personality'] as Map<String, dynamic>,
        ),
  systemPrompt: json['system_prompt'] as String?,
  greetingMessage: json['greeting_message'] as String?,
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  isPublic: json['is_public'] as bool?,
  isNsfw: json['is_nsfw'] as bool?,
);

Map<String, dynamic> _$CreateCharacterRequestToJson(
  _CreateCharacterRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'tagline': instance.tagline,
  'description': instance.description,
  'avatar_url': instance.avatarUrl,
  'banner_url': instance.bannerUrl,
  'style': instance.style,
  'gender': instance.gender,
  'appearance': instance.appearance,
  'personality': instance.personality,
  'system_prompt': instance.systemPrompt,
  'greeting_message': instance.greetingMessage,
  'categories': instance.categories,
  'is_public': instance.isPublic,
  'is_nsfw': instance.isNsfw,
};

_UpdateCharacterRequest _$UpdateCharacterRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateCharacterRequest(
  name: json['name'] as String?,
  tagline: json['tagline'] as String?,
  description: json['description'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  bannerUrl: json['banner_url'] as String?,
  style: json['style'] as String?,
  gender: json['gender'] as String?,
  appearance: json['appearance'] == null
      ? null
      : CharacterAppearance.fromJson(
          json['appearance'] as Map<String, dynamic>,
        ),
  personality: json['personality'] == null
      ? null
      : CharacterPersonality.fromJson(
          json['personality'] as Map<String, dynamic>,
        ),
  systemPrompt: json['system_prompt'] as String?,
  greetingMessage: json['greeting_message'] as String?,
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  isPublic: json['is_public'] as bool?,
  isNsfw: json['is_nsfw'] as bool?,
);

Map<String, dynamic> _$UpdateCharacterRequestToJson(
  _UpdateCharacterRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'tagline': instance.tagline,
  'description': instance.description,
  'avatar_url': instance.avatarUrl,
  'banner_url': instance.bannerUrl,
  'style': instance.style,
  'gender': instance.gender,
  'appearance': instance.appearance,
  'personality': instance.personality,
  'system_prompt': instance.systemPrompt,
  'greeting_message': instance.greetingMessage,
  'categories': instance.categories,
  'is_public': instance.isPublic,
  'is_nsfw': instance.isNsfw,
};

_FavoriteResponse _$FavoriteResponseFromJson(Map<String, dynamic> json) =>
    _FavoriteResponse(isFavorited: json['is_favorited'] as bool);

Map<String, dynamic> _$FavoriteResponseToJson(_FavoriteResponse instance) =>
    <String, dynamic>{'is_favorited': instance.isFavorited};
