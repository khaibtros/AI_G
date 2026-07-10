// ============================================================
// AI Companions — Constants
// ============================================================

class AppConstants {
  AppConstants._();

  // ---- Categories ----
  static const List<String> categories = [
    'Roleplay',
    'Romance',
    'Adventure',
    'Sci-Fi',
    'Fantasy',
    'Comedy',
    'Drama',
    'Horror',
    'Mystery',
    'Slice of Life',
    'Action',
    'Wellness',
    'Productivity',
    'Creativity',
    'Entertainment',
    'Education',
  ];

  // ---- Personality Traits ----
  static const List<String> personalityTraits = [
    'Shy',
    'Confident',
    'Playful',
    'Serious',
    'Mysterious',
    'Caring',
    'Sarcastic',
    'Flirty',
    'Intellectual',
    'Adventurous',
    'Cheerful',
    'Melancholic',
    'Rebellious',
    'Gentle',
    'Fierce',
    'Witty',
    'Romantic',
    'Cunning',
    'Loyal',
    'Independent',
    'Empathetic',
    'Dominant',
    'Submissive',
    'Protective',
    'Mischievous',
  ];

  // ---- Communication Styles ----
  static const List<String> communicationStyles = [
    'Casual & Friendly',
    'Formal & Polite',
    'Flirty & Teasing',
    'Dark & Mysterious',
    'Energetic & Enthusiastic',
    'Calm & Soothing',
    'Sarcastic & Witty',
    'Poetic & Philosophical',
    'Direct & Bold',
    'Sweet & Affectionate',
  ];

  // ---- Speaking Tones ----
  static const List<String> speakingTones = [
    'Warm',
    'Cold',
    'Seductive',
    'Childlike',
    'Mature',
    'Robotic',
    'Ethereal',
    'Gruff',
    'Melodic',
    'Commanding',
  ];

  // ---- Character Styles ----
  static const List<CharacterStyleOption> characterStyles = [
    CharacterStyleOption(value: 'anime', label: 'Anime'),
    CharacterStyleOption(value: 'realistic', label: 'Realistic'),
    CharacterStyleOption(value: 'cartoon', label: 'Cartoon'),
    CharacterStyleOption(value: '3d', label: '3D'),
    CharacterStyleOption(value: 'pixel', label: 'Pixel'),
  ];

  // ---- Character Genders ----
  static const List<CharacterGenderOption> characterGenders = [
    CharacterGenderOption(value: 'female', label: 'Female'),
    CharacterGenderOption(value: 'male', label: 'Male'),
    CharacterGenderOption(value: 'non-binary', label: 'Non-binary'),
    CharacterGenderOption(value: 'other', label: 'Other'),
  ];

  // ---- Subscription Plans ----
  static const Map<String, SubscriptionPlan> plans = {
    'free': SubscriptionPlan(
      name: 'Free',
      price: 0,
      dailyMessages: 25,
      features: [
        '25 messages per day',
        'Access to public characters',
        'Create up to 3 characters',
        'Basic AI responses',
      ],
    ),
    'starter': SubscriptionPlan(
      name: 'Starter',
      price: 9.99,
      dailyMessages: 100,
      features: [
        '100 messages per day',
        'Access to all characters',
        'Create up to 10 characters',
        'Faster AI responses',
        '100 coins per month',
      ],
    ),
    'pro': SubscriptionPlan(
      name: 'Pro',
      price: 19.99,
      dailyMessages: 500,
      features: [
        '500 messages per day',
        'Access to all characters',
        'Unlimited character creation',
        'Priority AI responses (GPT-4o)',
        '500 coins per month',
        'Memory system',
        'Image generation',
      ],
    ),
    'ultimate': SubscriptionPlan(
      name: 'Ultimate',
      price: 39.99,
      dailyMessages: -1,
      features: [
        'Unlimited messages',
        'Access to all characters',
        'Unlimited character creation',
        'Best AI quality (GPT-4o)',
        '2000 coins per month',
        'Advanced memory',
        'Priority image generation',
        'Group chats',
        'Early access to features',
      ],
    ),
  };

  // ---- Limits ----
  static const int maxMessageLength = 5000;
  static const int maxCharacterNameLength = 50;
  static const int maxCharacterDescriptionLength = 2000;
  static const int maxBackstoryLength = 5000;
  static const int maxBioLength = 500;
  static const int contextWindowTokens = 4000;
  static const int recentMessageCount = 30;
  static const int memorySummaryTrigger = 20;

  // ---- AI Config ----
  static const String fastModel = 'gpt-4o-mini';
  static const String qualityModel = 'gpt-4o';

  // ---- Plan Limits ----
  static const Map<String, PlanLimits> planLimits = {
    'free': PlanLimits(dailyMessages: 25, maxCharacters: 3),
    'starter': PlanLimits(dailyMessages: 100, maxCharacters: 10),
    'pro': PlanLimits(dailyMessages: 500, maxCharacters: -1),
    'ultimate': PlanLimits(dailyMessages: -1, maxCharacters: -1),
  };

  // ---- Gifts ----
  static const List<GiftDefinition> gifts = [
    GiftDefinition(
      id: 'rose',
      name: 'Rose',
      icon: 'flower-outline',
      cost: 10,
      category: 'romantic',
      rarity: 'common',
      affinity: 5,
    ),
    GiftDefinition(
      id: 'love_letter',
      name: 'Love Letter',
      icon: 'mail-outline',
      cost: 15,
      category: 'romantic',
      rarity: 'common',
      affinity: 8,
    ),
    GiftDefinition(
      id: 'chocolate',
      name: 'Chocolate Box',
      icon: 'gift-outline',
      cost: 20,
      category: 'fun',
      rarity: 'common',
      affinity: 10,
    ),
    GiftDefinition(
      id: 'teddy_bear',
      name: 'Teddy Bear',
      icon: 'heart-outline',
      cost: 30,
      category: 'fun',
      rarity: 'rare',
      affinity: 15,
    ),
    GiftDefinition(
      id: 'perfume',
      name: 'Perfume',
      icon: 'water-outline',
      cost: 40,
      category: 'luxury',
      rarity: 'rare',
      affinity: 20,
    ),
    GiftDefinition(
      id: 'star',
      name: 'Shooting Star',
      icon: 'star-outline',
      cost: 50,
      category: 'special',
      rarity: 'rare',
      affinity: 25,
    ),
    GiftDefinition(
      id: 'necklace',
      name: 'Necklace',
      icon: 'sparkles-outline',
      cost: 75,
      category: 'luxury',
      rarity: 'epic',
      affinity: 35,
    ),
    GiftDefinition(
      id: 'crown',
      name: 'Royal Crown',
      icon: 'trophy-outline',
      cost: 100,
      category: 'luxury',
      rarity: 'epic',
      affinity: 50,
    ),
    GiftDefinition(
      id: 'diamond_ring',
      name: 'Diamond Ring',
      icon: 'diamond-outline',
      cost: 150,
      category: 'romantic',
      rarity: 'legendary',
      affinity: 75,
    ),
    GiftDefinition(
      id: 'eternal_flame',
      name: 'Eternal Flame',
      icon: 'flame-outline',
      cost: 200,
      category: 'special',
      rarity: 'legendary',
      affinity: 100,
    ),
  ];

  // ---- Rarity Colors ----
  static const Map<String, String> rarityColors = {
    'common': '#9CA3AF',
    'rare': '#3B82F6',
    'epic': '#A855F7',
    'legendary': '#F59E0B',
  };

  // ---- Generation Costs ----
  static const int imageGenCost = 20;
  static const int ttsCost = 5;

  // ---- Voice Models ----
  static const List<VoiceModel> voiceModels = [
    VoiceModel(value: 'alloy', label: 'Alloy'),
    VoiceModel(value: 'echo', label: 'Echo'),
    VoiceModel(value: 'fable', label: 'Fable'),
    VoiceModel(value: 'onyx', label: 'Onyx'),
    VoiceModel(value: 'nova', label: 'Nova'),
    VoiceModel(value: 'shimmer', label: 'Shimmer'),
  ];
}

// ---- Helper Classes ----

class CharacterStyleOption {
  final String value;
  final String label;

  const CharacterStyleOption({required this.value, required this.label});
}

class CharacterGenderOption {
  final String value;
  final String label;

  const CharacterGenderOption({required this.value, required this.label});
}

class SubscriptionPlan {
  final String name;
  final double price;
  final int dailyMessages;
  final List<String> features;

  const SubscriptionPlan({
    required this.name,
    required this.price,
    required this.dailyMessages,
    required this.features,
  });
}

class PlanLimits {
  final int dailyMessages;
  final int maxCharacters;

  const PlanLimits({required this.dailyMessages, required this.maxCharacters});
}

class GiftDefinition {
  final String id;
  final String name;
  final String icon;
  final int cost;
  final String category;
  final String rarity;
  final int affinity;

  const GiftDefinition({
    required this.id,
    required this.name,
    required this.icon,
    required this.cost,
    required this.category,
    required this.rarity,
    required this.affinity,
  });
}

class VoiceModel {
  final String value;
  final String label;

  const VoiceModel({required this.value, required this.label});
}
