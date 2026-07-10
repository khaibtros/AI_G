// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoiceResponse _$VoiceResponseFromJson(Map<String, dynamic> json) =>
    _VoiceResponse(
      audioUrl: json['audioUrl'] as String,
      newBalance: (json['newBalance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VoiceResponseToJson(_VoiceResponse instance) =>
    <String, dynamic>{
      'audioUrl': instance.audioUrl,
      'newBalance': instance.newBalance,
    };
