// Character Service Request/Response Models

import 'package:freezed_annotation/freezed_annotation.dart';
import 'character_appearance.dart';
import 'character_personality.dart';

part 'character_requests.freezed.dart';
part 'character_requests.g.dart';

@freezed
abstract class CreateCharacterRequest with _$CreateCharacterRequest {
  const factory CreateCharacterRequest({
    required String name,
    String? tagline,
    String? description,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'banner_url') String? bannerUrl,
    String? style,
    String? gender,
    CharacterAppearance? appearance,
    CharacterPersonality? personality,
    @JsonKey(name: 'system_prompt') String? systemPrompt,
    @JsonKey(name: 'greeting_message') String? greetingMessage,
    List<String>? categories,
    @JsonKey(name: 'is_public') bool? isPublic,
    @JsonKey(name: 'is_nsfw') bool? isNsfw,
  }) = _CreateCharacterRequest;

  factory CreateCharacterRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCharacterRequestFromJson(json);
}

@freezed
abstract class UpdateCharacterRequest with _$UpdateCharacterRequest {
  const factory UpdateCharacterRequest({
    String? name,
    String? tagline,
    String? description,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'banner_url') String? bannerUrl,
    String? style,
    String? gender,
    CharacterAppearance? appearance,
    CharacterPersonality? personality,
    @JsonKey(name: 'system_prompt') String? systemPrompt,
    @JsonKey(name: 'greeting_message') String? greetingMessage,
    List<String>? categories,
    @JsonKey(name: 'is_public') bool? isPublic,
    @JsonKey(name: 'is_nsfw') bool? isNsfw,
  }) = _UpdateCharacterRequest;

  factory UpdateCharacterRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCharacterRequestFromJson(json);
}

@freezed
abstract class FavoriteResponse with _$FavoriteResponse {
  const factory FavoriteResponse({
    @JsonKey(name: 'is_favorited') required bool isFavorited,
  }) = _FavoriteResponse;

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);
}
