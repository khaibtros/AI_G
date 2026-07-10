// Character Personality Model

import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_personality.freezed.dart';
part 'character_personality.g.dart';

@freezed
abstract class CharacterPersonality with _$CharacterPersonality {
  const factory CharacterPersonality({
    List<String>? traits,
    List<String>? interests,
    @JsonKey(name: 'communication_style') String? communicationStyle,
    String? backstory,
    List<String>? quirks,
    List<String>? likes,
    List<String>? dislikes,
    @JsonKey(name: 'speaking_tone') String? speakingTone,
  }) = _CharacterPersonality;

  factory CharacterPersonality.fromJson(Map<String, dynamic> json) =>
      _$CharacterPersonalityFromJson(json);
}
