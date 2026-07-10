// Chat Service Response Models

import 'package:freezed_annotation/freezed_annotation.dart';
import 'conversation.dart';
import 'message.dart';

part 'chat_responses.freezed.dart';
part 'chat_responses.g.dart';

@freezed
abstract class ConversationData with _$ConversationData {
  const factory ConversationData({
    required Conversation conversation,
    @Default([]) List<Message> messages,
  }) = _ConversationData;

  factory ConversationData.fromJson(Map<String, dynamic> json) =>
      _$ConversationDataFromJson(json);
}

@freezed
abstract class SendMessageResponse with _$SendMessageResponse {
  const factory SendMessageResponse({
    @JsonKey(name: 'user_message') required Message userMessage,
    @JsonKey(name: 'ai_message') required Message aiMessage,
  }) = _SendMessageResponse;

  factory SendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendMessageResponseFromJson(json);
}

@freezed
abstract class RegenerateResponse with _$RegenerateResponse {
  const factory RegenerateResponse({
    @JsonKey(name: 'ai_message') required Message aiMessage,
  }) = _RegenerateResponse;

  factory RegenerateResponse.fromJson(Map<String, dynamic> json) =>
      _$RegenerateResponseFromJson(json);
}

@freezed
abstract class SendGiftResponse with _$SendGiftResponse {
  const factory SendGiftResponse({
    @JsonKey(name: 'gift_message') required Message giftMessage,
    @JsonKey(name: 'ai_message') required Message aiMessage,
    required Map<String, dynamic> gift,
    @JsonKey(name: 'new_balance') required int newBalance,
  }) = _SendGiftResponse;

  factory SendGiftResponse.fromJson(Map<String, dynamic> json) =>
      _$SendGiftResponseFromJson(json);
}
