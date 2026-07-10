// Premium Service Response Models

import 'package:freezed_annotation/freezed_annotation.dart';
import 'subscription.dart';

part 'premium_responses.freezed.dart';
part 'premium_responses.g.dart';

@freezed
abstract class SubscriptionResponse with _$SubscriptionResponse {
  const factory SubscriptionResponse({required Subscription subscription}) =
      _SubscriptionResponse;

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);
}
