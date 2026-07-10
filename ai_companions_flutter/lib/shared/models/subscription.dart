// Subscription Model

import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

@freezed
abstract class Subscription with _$Subscription {
  const factory Subscription({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String plan,
    required SubscriptionStatus status,
    String? provider,
    @JsonKey(name: 'current_period_start') String? currentPeriodStart,
    @JsonKey(name: 'current_period_end') String? currentPeriodEnd,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}
