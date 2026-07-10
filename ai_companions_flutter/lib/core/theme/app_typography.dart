// AI Companions — Typography System

import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  // Font family
  static const String fontFamily = 'Inter';

  // Font sizes
  static const double xs = 11;
  static const double sm = 13;
  static const double base = 15;
  static const double md = 16;
  static const double lg = 18;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 30;
  static const double xxxxl = 36;

  // Line heights
  static const double lineHeightXs = 16;
  static const double lineHeightSm = 18;
  static const double lineHeightBase = 22;
  static const double lineHeightMd = 24;
  static const double lineHeightLg = 28;
  static const double lineHeightXl = 30;
  static const double lineHeightXxl = 32;
  static const double lineHeightXxxl = 40;
  static const double lineHeightXxxxl = 44;

  // Text styles
  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: xxxxl,
    height: lineHeightXxxxl / xxxxl,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: xxxl,
    height: lineHeightXxxl / xxxl,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: xxl,
    height: lineHeightXxl / xxl,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: xl,
    height: lineHeightXl / xl,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: lg,
    height: lineHeightLg / lg,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: base,
    height: lineHeightBase / base,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: base,
    height: lineHeightBase / base,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodySemiBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: base,
    height: lineHeightBase / base,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: base,
    height: lineHeightBase / base,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: sm,
    height: lineHeightSm / sm,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: xs,
    height: lineHeightXs / xs,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: md,
    height: lineHeightMd / md,
    fontWeight: FontWeight.w600,
  );
}
