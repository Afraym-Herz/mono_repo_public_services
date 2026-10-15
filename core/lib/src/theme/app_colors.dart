// lib/core/theme/app_colors.dart

import 'package:flutter/material.dart';

class AppColors {
  // ============== Primary Colors (OMS Green) ==============
  static const Color primaryColor = Color(0xFF0F6942); // OMS Deep Green
  static const Color primaryDark = Color(0xFF0B4F32); // Darker Green
  static const Color primaryLight = Color(0xFF1B8C5B); // Lighter Green

  // Dark-mode primary (lighter so it pops on dark surfaces)
  static const Color primaryDarkMode = Color(0xFF28A770); // Vibrant Green

  static const Color secondaryColor = Color(0xFF00BCD4); // Cyan 500
  static const Color secondaryDark = Color(0xFF0097A7); // Cyan 700
  static const Color secondaryLight = Color(0xFF4DD0E1); // Cyan 300

  // ============== Neutral Colors ==============
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1E2125);
  static const Color transparent = Colors.transparent;

  // Text Colors
  static const Color textPrimary = Color(0xFF3D434A);
  static const Color textSecondary = Color(0xFF585D65);
  static const Color textTertiary = Color(0xFF8E8E93);
  static const Color textHint = Color(0xFF646A72);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF343636);
  static const Color backgroundCard = Color(0xFFFFFFFF);
  static const Color backgroundSurface = Color(0xFFF7F9FC);

  // ============== Functional Colors ==============
  // Success Colors
  static const Color success = Color(0xFF5ABD88);
  static const Color successLight = Color(0xFF7CC99C);
  static const Color successDark = Color(0xFF4A9F73);

  // Error Colors
  static const Color error = Color(0xFFFF4848);
  static const Color errorLight = Color(0xFFFF6B6B);
  static const Color errorDark = Color(0xFFE63939);

  // Warning Colors
  static const Color warning = Color(0xFFFFB020);
  static const Color warningLight = Color(0xFFFFC554);
  static const Color warningDark = Color(0xFFE69D1C);

  // Info Colors
  static const Color info = Color(0xFF286FC6);
  static const Color infoLight = Color(0xFF4A8BD1);
  static const Color infoDark = Color(0xFF1F5BA1);

  // ============== Surface Colors ==============
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color surfaceGrey = Color(0xFFF9F9F9);
  static const Color surfaceLight = Color(0xFFF4F7FC);
  static const Color surfaceDark = Color(0xFF2E2E2E);

  // Border Colors
  static const Color borderPrimary = Color(0xFFDCDCDC);
  static const Color borderSecondary = Color(0xFFE4E4E4);
  static const Color borderLight = Color(0xFFE8E8E8);
  static const Color borderFocus = primaryColor;
  static const Color borderDark = Color(0xFF3D4160);
  static const Color inputFillDark = Color(0xFF2A2D3E);

  // ============== Interactive Colors ==============
  static const Color buttonPrimary = primaryColor;
  static const Color buttonSecondary = Color(0xFFF2F2F6);
  static const Color buttonDisabled = Color(0xFF979797);
  static const Color buttonDanger = error;
  static const Color buttonSuccess = success;

  // ============== Specialty Colors ==============
  // Print & Actions
  static const Color printColor = Color(0xFF0060D5);
  static const Color downloadColor = Color(0xFF009CD6);
  static const Color scanColor = Color(0xFF00C853);
  static const Color resetColor = Color(0xFFECF1F7);

  static const Color dangerRed = Color(0xFFE11D48);

  // Gradients
  static const Color gradientStart = Color(0xFF45A735);
  static const Color gradientEnd = Color(0xFF5ABD88);

  // Shimmer Colors
  static const Color shimmerBase = Color(0xFFD6D6D6);
  static const Color shimmerHighlight = Color(0xFFEDEDED);

  // Shadow Colors
  static const Color shadowLight = Color(0x10000000);
  static const Color shadowMedium = Color(0x20000000);
  static const Color shadowDark = Color(0x30000000);

  // Modal / scrim
  static const Color scrim = Color(0x8C000000);

  // ThemeManager tokens (previously hardcoded)
  static const Color errorDeep = Color(0xFFBD0A00);
  static const Color primaryContainerLight = Color(0xFFD1E4FF);
  static const Color checkoutTextLight = Color(0xFF4C5D70);
  static const Color categoryProductDark = Color(0xFF989797);
  static const Color iconBgDark = Color(0xFF2E2E2E);
  static const Color iconBgLight = Color(0xFFF9F9F9);
  static const Color disabledBorderLight = Color(0xFFCBD5E1);
  static const Color disabledBorderDark = Color(0xFF4B5563);
}
