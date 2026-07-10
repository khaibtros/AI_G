// Group Service Response Models

import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'group_responses.freezed.dart';
part 'group_responses.g.dart';

@freezed
abstract class GroupMessageResponse with _$GroupMessageResponse {
  const factory GroupMessageResponse({
    @JsonKey(name: 'user_message') required Message userMessage,
    @JsonKey(name: 'ai_messages') required List<Message> aiMessages,
  }) = _GroupMessageResponse;

  factory GroupMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupMessageResponseFromJson(json);
}
