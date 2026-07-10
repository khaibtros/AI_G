// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerationRequest _$GenerationRequestFromJson(Map<String, dynamic> json) =>
    _GenerationRequest(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      prompt: json['prompt'] as String,
      style: json['style'] as String?,
      status: $enumDecode(_$GenerationStatusEnumMap, json['status']),
      resultUrl: json['result_url'] as String?,
      coinCost: (json['coin_cost'] as num).toInt(),
      errorMessage: json['error_message'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$GenerationRequestToJson(_GenerationRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'prompt': instance.prompt,
      'style': instance.style,
      'status': _$GenerationStatusEnumMap[instance.status]!,
      'result_url': instance.resultUrl,
      'coin_cost': instance.coinCost,
      'error_message': instance.errorMessage,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$GenerationStatusEnumMap = {
  GenerationStatus.pending: 'pending',
  GenerationStatus.processing: 'processing',
  GenerationStatus.completed: 'completed',
  GenerationStatus.failed: 'failed',
};
