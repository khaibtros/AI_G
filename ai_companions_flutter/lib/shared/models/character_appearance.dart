// Character Appearance Model

import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_appearance.freezed.dart';
part 'character_appearance.g.dart';

@freezed
abstract class CharacterAppearance with _$CharacterAppearance {
  const factory CharacterAppearance({
    @JsonKey(name: 'hair_color') String? hairColor,
    @JsonKey(name: 'eye_color') String? eyeColor,
    @JsonKey(name: 'body_type') String? bodyType,
    String? outfit,
    @JsonKey(name: 'distinguishing_features') String? distinguishingFeatures,
    @JsonKey(name: 'age_appearance') String? ageAppearance,
  }) = _CharacterAppearance;

  factory CharacterAppearance.fromJson(Map<String, dynamic> json) =>
      _$CharacterAppearanceFromJson(json);
}
