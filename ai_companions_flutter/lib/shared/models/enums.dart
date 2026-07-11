// Enums for the application

import 'package:json_annotation/json_annotation.dart';

enum SubscriptionTier {
  free,
  starter,
  pro,
  ultimate;

  String get displayName {
    switch (this) {
      case SubscriptionTier.free:
        return 'Free';
      case SubscriptionTier.starter:
        return 'Starter';
      case SubscriptionTier.pro:
        return 'Pro';
      case SubscriptionTier.ultimate:
        return 'Ultimate';
    }
  }
}

enum SubscriptionStatus {
  active,
  cancelled,
  expired,
  pastDue;

  String get displayName {
    switch (this) {
      case SubscriptionStatus.active:
        return 'Active';
      case SubscriptionStatus.cancelled:
        return 'Cancelled';
      case SubscriptionStatus.expired:
        return 'Expired';
      case SubscriptionStatus.pastDue:
        return 'Past Due';
    }
  }
}

enum CharacterStyle {
  anime,
  realistic,
  cartoon,
  @JsonValue('3d')
  threeD,
  pixel;

  String get value {
    switch (this) {
      case CharacterStyle.anime:
        return 'anime';
      case CharacterStyle.realistic:
        return 'realistic';
      case CharacterStyle.cartoon:
        return 'cartoon';
      case CharacterStyle.threeD:
        return '3d';
      case CharacterStyle.pixel:
        return 'pixel';
    }
  }

  String get displayName {
    switch (this) {
      case CharacterStyle.anime:
        return 'Anime';
      case CharacterStyle.realistic:
        return 'Realistic';
      case CharacterStyle.cartoon:
        return 'Cartoon';
      case CharacterStyle.threeD:
        return '3D';
      case CharacterStyle.pixel:
        return 'Pixel';
    }
  }

  static CharacterStyle fromString(String value) {
    switch (value) {
      case 'anime':
        return CharacterStyle.anime;
      case 'realistic':
        return CharacterStyle.realistic;
      case 'cartoon':
        return CharacterStyle.cartoon;
      case '3d':
        return CharacterStyle.threeD;
      case 'pixel':
        return CharacterStyle.pixel;
      default:
        return CharacterStyle.anime;
    }
  }
}

enum CharacterGender {
  male,
  female,
  @JsonValue('non-binary')
  nonBinary,
  other;

  String get value {
    switch (this) {
      case CharacterGender.male:
        return 'male';
      case CharacterGender.female:
        return 'female';
      case CharacterGender.nonBinary:
        return 'non-binary';
      case CharacterGender.other:
        return 'other';
    }
  }

  String get displayName {
    switch (this) {
      case CharacterGender.male:
        return 'Male';
      case CharacterGender.female:
        return 'Female';
      case CharacterGender.nonBinary:
        return 'Non-binary';
      case CharacterGender.other:
        return 'Other';
    }
  }

  static CharacterGender fromString(String value) {
    switch (value) {
      case 'male':
        return CharacterGender.male;
      case 'female':
        return CharacterGender.female;
      case 'non-binary':
        return CharacterGender.nonBinary;
      case 'other':
        return CharacterGender.other;
      default:
        return CharacterGender.female;
    }
  }
}

enum SenderType {
  user,
  character,
  system;

  static SenderType fromString(String value) {
    switch (value) {
      case 'user':
        return SenderType.user;
      case 'character':
        return SenderType.character;
      case 'system':
        return SenderType.system;
      default:
        return SenderType.user;
    }
  }
}

enum TransactionType {
  purchase,
  reward,
  spend,
  refund,
  dailyBonus;

  String get value {
    switch (this) {
      case TransactionType.purchase:
        return 'purchase';
      case TransactionType.reward:
        return 'reward';
      case TransactionType.spend:
        return 'spend';
      case TransactionType.refund:
        return 'refund';
      case TransactionType.dailyBonus:
        return 'daily_bonus';
    }
  }

  static TransactionType fromString(String value) {
    switch (value) {
      case 'purchase':
        return TransactionType.purchase;
      case 'reward':
        return TransactionType.reward;
      case 'spend':
        return TransactionType.spend;
      case 'refund':
        return TransactionType.refund;
      case 'daily_bonus':
        return TransactionType.dailyBonus;
      default:
        return TransactionType.purchase;
    }
  }
}

enum GenerationStatus {
  pending,
  processing,
  completed,
  failed;

  static GenerationStatus fromString(String value) {
    switch (value) {
      case 'pending':
        return GenerationStatus.pending;
      case 'processing':
        return GenerationStatus.processing;
      case 'completed':
        return GenerationStatus.completed;
      case 'failed':
        return GenerationStatus.failed;
      default:
        return GenerationStatus.pending;
    }
  }
}
