// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_personality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterPersonality _$CharacterPersonalityFromJson(
  Map<String, dynamic> json,
) => _CharacterPersonality(
  traits: (json['traits'] as List<dynamic>?)?.map((e) => e as String).toList(),
  interests: (json['interests'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  communicationStyle: json['communication_style'] as String?,
  backstory: json['backstory'] as String?,
  quirks: (json['quirks'] as List<dynamic>?)?.map((e) => e as String).toList(),
  likes: (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList(),
  dislikes: (json['dislikes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  speakingTone: json['speaking_tone'] as String?,
);

Map<String, dynamic> _$CharacterPersonalityToJson(
  _CharacterPersonality instance,
) => <String, dynamic>{
  'traits': instance.traits,
  'interests': instance.interests,
  'communication_style': instance.communicationStyle,
  'backstory': instance.backstory,
  'quirks': instance.quirks,
  'likes': instance.likes,
  'dislikes': instance.dislikes,
  'speaking_tone': instance.speakingTone,
};
