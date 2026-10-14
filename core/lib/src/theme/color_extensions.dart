// lib/core/theme/color_extensions.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'theme_manager.dart';

extension AppColorExtensions on BuildContext {
  // Primary Colors
  Color get primaryColor => AppColors.primaryColor;
  Color get secondaryColor => AppColors.secondaryColor;

  // Dynamic Colors (حسب الثيم)
  Color get dynamicTextColor => ThemeManager.getTextColor();
  Color get dynamicTitleColor => ThemeManager.getTitleColor();
  Color get dynamicBackgroundColor => ThemeManager.getBackgroundColor();
  Color get dynamicSurfaceColor => ThemeManager.getSurfaceColor();
  Color get dynamicBorderColor => ThemeManager.getBorderColor();

  // Functional Colors
  Color get successColor => AppColors.success;
  Color get errorColor => AppColors.error;
  Color get warningColor => AppColors.warning;
  Color get infoColor => AppColors.info;

  // Surface Colors
  Color get cardColor => AppColors.backgroundCard;
  Color get surfaceColor => AppColors.surfaceLight;

  // Interactive Colors
  Color get buttonPrimaryColor => AppColors.buttonPrimary;
  Color get buttonSecondaryColor => AppColors.buttonSecondary;
  Color get buttonDisabledColor => AppColors.buttonDisabled;
}
