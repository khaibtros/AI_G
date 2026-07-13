// AI Companions — Dark Cyberpunk Color System
// Derived from React Native theme

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Core backgrounds
  static const Color background = Color(0xFF0A0A0F);
  static const Color surface = Color(0xFF1A1A2E);
  static const Color surfaceElevated = Color(0xFF16213E);
  static const Color surfaceLight = Color(0xFF1F2937);
  static const Color surfaceBorder = Color(0x267C3AED); // rgba(124, 58, 237, 0.15)

  // Primary brand
  static const Color primary = Color(0xFF7C3AED);
  static const Color primaryLight = Color(0xFFA78BFA);
  static const Color primaryDark = Color(0xFF5B21B6);
  static const Color primaryMuted = Color(0x337C3AED); // rgba(124, 58, 237, 0.2)
  static const Color primaryGlow = Color(0x667C3AED); // rgba(124, 58, 237, 0.4)

  // Accent / Secondary
  static const Color accent = Color(0xFF8B5CF6);
  static const Color accentPink = Color(0xFFEC4899);
  static const Color accentCyan = Color(0xFF06B6D4);
  static const Color accentGold = Color(0xFFF59E0B);

  // CTA (Call to Action)
  static const Color cta = Color(0xFF7C3AED);
  static const Color ctaGradientStart = Color(0xFF7C3AED);
  static const Color ctaGradientEnd = Color(0xFFA855F7);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color textMuted = Color(0xFF6B7280);
  static const Color textDisabled = Color(0xFF4B5563);

  // Semantic
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);
  static const Color online = Color(0xFF10B981);

  // Chat
  static const Color userBubble = Color(0xFF7C3AED);
  static const Color userBubbleGradientStart = Color(0xFF7C3AED);
  static const Color userBubbleGradientEnd = Color(0xFF9333EA);
  static const Color aiBubble = Color(0xFF1F2937);
  static const Color aiBubbleBorder = Color(0x1A7C3AED); // rgba(124, 58, 237, 0.1)

  // Tab bar
  static const Color tabBarBg = Color(0xFF0D0D14);
  static const Color tabBarBorder = Color(0x267C3AED); // rgba(124, 58, 237, 0.15)
  static const Color tabActive = Color(0xFF7C3AED);
  static const Color tabInactive = Color(0xFF6B7280);

  // Misc
  static const Color overlay = Color(0x99000000); // rgba(0, 0, 0, 0.6)
  static const Color shimmer = Color(0xFF2A2A3E);
  static const Color shimmerHighlight = Color(0xFF3A3A4E);
  static const Color inputBg = Color(0xFF1A1A2E);
  static const Color inputBorder = Color(0xFF2D2D44);
  static const Color inputFocusBorder = Color(0xFF7C3AED);
  static const Color cardBorder = Color(0x0FFFFFFF); // rgba(255, 255, 255, 0.06)
  static const Color divider = Color(0x14FFFFFF); // rgba(255, 255, 255, 0.08)

  // Gradient definitions
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [ctaGradientStart, ctaGradientEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient userBubbleGradient = LinearGradient(
    colors: [userBubbleGradientStart, userBubbleGradientEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient featuredOverlay = LinearGradient(
    colors: [Colors.transparent, Colors.black.withAlpha(217)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
