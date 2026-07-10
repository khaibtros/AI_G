// Voice Service Response Models

import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_responses.freezed.dart';
part 'voice_responses.g.dart';

@freezed
abstract class VoiceResponse with _$VoiceResponse {
  const factory VoiceResponse({
    @JsonKey(name: 'audioUrl') required String audioUrl,
    @JsonKey(name: 'newBalance') int? newBalance,
  }) = _VoiceResponse;

  factory VoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$VoiceResponseFromJson(json);
}
