// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupMessageResponse _$GroupMessageResponseFromJson(
  Map<String, dynamic> json,
) => _GroupMessageResponse(
  userMessage: Message.fromJson(json['user_message'] as Map<String, dynamic>),
  aiMessages: (json['ai_messages'] as List<dynamic>)
      .map((e) => Message.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GroupMessageResponseToJson(
  _GroupMessageResponse instance,
) => <String, dynamic>{
  'user_message': instance.userMessage,
  'ai_messages': instance.aiMessages,
};
