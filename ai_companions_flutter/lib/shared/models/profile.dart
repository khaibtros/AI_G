// Profile Model

import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String id,
    String? username,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? bio,
    @JsonKey(name: 'coin_balance') @Default(0) int coinBalance,
    @JsonKey(name: 'subscription_tier')
    @Default(SubscriptionTier.free)
    SubscriptionTier subscriptionTier,
    @JsonKey(name: 'daily_message_count') @Default(0) int dailyMessageCount,
    @JsonKey(name: 'last_message_reset_at') required String lastMessageResetAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'is_admin') @Default(false) bool isAdmin,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
