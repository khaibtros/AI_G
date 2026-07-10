// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_appearance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterAppearance _$CharacterAppearanceFromJson(Map<String, dynamic> json) =>
    _CharacterAppearance(
      hairColor: json['hair_color'] as String?,
      eyeColor: json['eye_color'] as String?,
      bodyType: json['body_type'] as String?,
      outfit: json['outfit'] as String?,
      distinguishingFeatures: json['distinguishing_features'] as String?,
      ageAppearance: json['age_appearance'] as String?,
    );

Map<String, dynamic> _$CharacterAppearanceToJson(
  _CharacterAppearance instance,
) => <String, dynamic>{
  'hair_color': instance.hairColor,
  'eye_color': instance.eyeColor,
  'body_type': instance.bodyType,
  'outfit': instance.outfit,
  'distinguishing_features': instance.distinguishingFeatures,
  'age_appearance': instance.ageAppearance,
};
