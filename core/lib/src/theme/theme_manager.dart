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
      _isDarkMode ? AppColors.errorDeep : AppColors.error;

  static Color getSplashColor1() => _isDarkMode
      ? AppColors.white.withValues(alpha: 0.15)
      : AppColors.white;

  static Color getTextColor() =>
      _isDarkMode ? AppColors.white : AppColors.textPrimary;

  static Color getTitleColor() => _isDarkMode
      ? AppColors.primaryContainerLight // primaryContainer light readable on dark bg
      : AppColors.primaryDark; // deep blue on light bg

  static Color getCheckoutTextColor() =>
      _isDarkMode ? AppColors.primaryDarkMode : AppColors.checkoutTextLight;

  static Color getCategoryWithProductColor() =>
      _isDarkMode ? AppColors.categoryProductDark : AppColors.white;

  static Color getIconBg() =>
      _isDarkMode ? AppColors.iconBgDark : AppColors.iconBgLight;

  static Color getBackgroundColor() =>
      _isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight;

  static Color getSurfaceColor() =>
      _isDarkMode ? AppColors.surfaceDark : AppColors.surfaceWhite;

  static Color getBorderColor() =>
      _isDarkMode ? AppColors.borderDark : AppColors.borderPrimary;
}
