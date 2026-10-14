// lib/core/theme/theme_manager.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Stateless helper that bridges the old imperative ThemeManager API with the
/// Cubit-driven theme system.
///
/// Keep ThemeManager in sync via [setDarkMode] whenever [ThemeCubit] emits a
/// new state (already done in main.dart).
class ThemeManager {
  static bool _isDarkMode = false;

  static bool get isDarkMode => _isDarkMode;

  static void setDarkMode(bool value) => _isDarkMode = value;

  // --- Dynamic helpers -------------------------------------------------------

  static Color getRedColor() =>
      _isDarkMode ? const Color(0xFFbd0a00) : AppColors.error;

  static Color getSplashColor1() =>
      _isDarkMode ? Colors.white.withValues(alpha: 0.15) : Colors.white;

  static Color getTextColor() =>
      _isDarkMode ? AppColors.white : AppColors.textPrimary;

  static Color getTitleColor() => _isDarkMode
      ? const Color(0xFFD1E4FF) // primaryContainer light readable on dark bg
      : AppColors.primaryDark; // deep blue on light bg

  static Color getCheckoutTextColor() =>
      _isDarkMode ? AppColors.primaryDarkMode : const Color(0xFF4C5D70);

  static Color getCategoryWithProductColor() =>
      _isDarkMode ? const Color(0xFF989797) : AppColors.white;

  static Color getIconBg() =>
      _isDarkMode ? const Color(0xFF2E2E2E) : const Color(0xFFF9F9F9);

  static Color getBackgroundColor() =>
      _isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight;

  static Color getSurfaceColor() =>
      _isDarkMode ? AppColors.surfaceDark : AppColors.surfaceWhite;

  static Color getBorderColor() =>
      _isDarkMode ? const Color(0xFF3D4160) : AppColors.borderPrimary;
}
