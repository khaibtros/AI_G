// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationData _$ConversationDataFromJson(Map<String, dynamic> json) =>
    _ConversationData(
      conversation: Conversation.fromJson(
        json['conversation'] as Map<String, dynamic>,
      ),
      messages:
          (json['messages'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ConversationDataToJson(_ConversationData instance) =>
    <String, dynamic>{
      'conversation': instance.conversation,
      'messages': instance.messages,
    };

_SendMessageResponse _$SendMessageResponseFromJson(Map<String, dynamic> json) =>
    _SendMessageResponse(
      userMessage: Message.fromJson(
        json['user_message'] as Map<String, dynamic>,
      ),
      aiMessage: Message.fromJson(json['ai_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendMessageResponseToJson(
  _SendMessageResponse instance,
) => <String, dynamic>{
  'user_message': instance.userMessage,
  'ai_message': instance.aiMessage,
};

_RegenerateResponse _$RegenerateResponseFromJson(Map<String, dynamic> json) =>
    _RegenerateResponse(
      aiMessage: Message.fromJson(json['ai_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegenerateResponseToJson(_RegenerateResponse instance) =>
    <String, dynamic>{'ai_message': instance.aiMessage};

_SendGiftResponse _$SendGiftResponseFromJson(Map<String, dynamic> json) =>
    _SendGiftResponse(
      giftMessage: Message.fromJson(
        json['gift_message'] as Map<String, dynamic>,
      ),
      aiMessage: Message.fromJson(json['ai_message'] as Map<String, dynamic>),
      gift: json['gift'] as Map<String, dynamic>,
      newBalance: (json['new_balance'] as num).toInt(),
    );

Map<String, dynamic> _$SendGiftResponseToJson(_SendGiftResponse instance) =>
    <String, dynamic>{
      'gift_message': instance.giftMessage,
      'ai_message': instance.aiMessage,
      'gift': instance.gift,
      'new_balance': instance.newBalance,
    };
