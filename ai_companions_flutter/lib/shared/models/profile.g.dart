// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
  id: json['id'] as String,
  username: json['username'] as String?,
  displayName: json['display_name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  bio: json['bio'] as String?,
  coinBalance: (json['coin_balance'] as num?)?.toInt() ?? 0,
  subscriptionTier:
      $enumDecodeNullable(
        _$SubscriptionTierEnumMap,
        json['subscription_tier'],
      ) ??
      SubscriptionTier.free,
  dailyMessageCount: (json['daily_message_count'] as num?)?.toInt() ?? 0,
  lastMessageResetAt: json['last_message_reset_at'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  isAdmin: json['is_admin'] as bool? ?? false,
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'display_name': instance.displayName,
  'avatar_url': instance.avatarUrl,
  'bio': instance.bio,
  'coin_balance': instance.coinBalance,
  'subscription_tier': _$SubscriptionTierEnumMap[instance.subscriptionTier]!,
  'daily_message_count': instance.dailyMessageCount,
  'last_message_reset_at': instance.lastMessageResetAt,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'is_admin': instance.isAdmin,
};

const _$SubscriptionTierEnumMap = {
  SubscriptionTier.free: 'free',
  SubscriptionTier.starter: 'starter',
  SubscriptionTier.pro: 'pro',
  SubscriptionTier.ultimate: 'ultimate',
};
