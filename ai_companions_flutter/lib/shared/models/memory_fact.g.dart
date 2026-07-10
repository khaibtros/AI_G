// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_fact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemoryFact _$MemoryFactFromJson(Map<String, dynamic> json) => _MemoryFact(
  key: json['key'] as String,
  value: json['value'] as String,
  confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$MemoryFactToJson(_MemoryFact instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'confidence': instance.confidence,
    };
