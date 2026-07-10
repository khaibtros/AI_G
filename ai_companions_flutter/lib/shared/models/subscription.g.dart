// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Subscription _$SubscriptionFromJson(Map<String, dynamic> json) =>
    _Subscription(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      plan: json['plan'] as String,
      status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
      provider: json['provider'] as String?,
      currentPeriodStart: json['current_period_start'] as String?,
      currentPeriodEnd: json['current_period_end'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$SubscriptionToJson(_Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'plan': instance.plan,
      'status': _$SubscriptionStatusEnumMap[instance.status]!,
      'provider': instance.provider,
      'current_period_start': instance.currentPeriodStart,
      'current_period_end': instance.currentPeriodEnd,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.active: 'active',
  SubscriptionStatus.cancelled: 'cancelled',
  SubscriptionStatus.expired: 'expired',
  SubscriptionStatus.pastDue: 'pastDue',
};
