// Generation Request Model

import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'generation_request.freezed.dart';
part 'generation_request.g.dart';

@freezed
abstract class GenerationRequest with _$GenerationRequest {
  const factory GenerationRequest({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String prompt,
    String? style,
    required GenerationStatus status,
    @JsonKey(name: 'result_url') String? resultUrl,
    @JsonKey(name: 'coin_cost') required int coinCost,
    @JsonKey(name: 'error_message') String? errorMessage,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _GenerationRequest;

  factory GenerationRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerationRequestFromJson(json);
}
