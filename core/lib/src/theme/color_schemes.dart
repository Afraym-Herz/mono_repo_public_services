// lib/core/theme/color_schemes.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:core/src/utils/app_constants.dart';
import 'package:core/src/theme/dimensions.dart';
import 'app_colors.dart';
import 'text_theme_builder.dart';

/// Centralised theme definitions for the app.
/// Both [light] and [dark] are built entirely from [AppColors] —
/// no hardcoded hex values here.
class AppColorSchemes {
  // ─── Static ColorScheme references (for widgets that need them directly) ───

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: AppColors.white,
    primaryContainer: Color(0xFFD1E4FF),
    onPrimaryContainer: Color(0xFF001D36),
    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.white,
    secondaryContainer: Color(0xFFB2EBF2),
    onSecondaryContainer: Color(0xFF002022),
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.surfaceWhite,
    onSurface: AppColors.textPrimary,
    surfaceContainerHighest: Color(0xFFEEF3FF),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryDarkMode,
    onPrimary: Color(0xFF003258),
    primaryContainer: Color(0xFF00497D),
    onPrimaryContainer: Color(0xFFD1E4FF),
    secondary: Color(0xFF80DEEA),
    onSecondary: Color(0xFF00363D),
    secondaryContainer: Color(0xFF004E59),
    onSecondaryContainer: Color(0xFFB2EBF2),
    error: AppColors.error,
    onError: AppColors.white,
    surface: Color(0xFF1C1B1F),
    onSurface: AppColors.white,
    surfaceContainerHighest: Color(0xFF2A2D3E),
  );

  // ─── Full ThemeData ────────────────────────────────────────────────────────

  static ThemeData get light => _buildTheme(
    colorScheme: lightColorScheme,
    scaffoldBg: AppColors.clinicBackground,
    cardBg: AppColors.white,
    hintColor: AppColors.textHint,
    appBarBg: AppColors.white,
    appBarForeground: AppColors.textPrimary,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    inputFill: const Color(0xFFEEF3FF),
    inputEnabledBorder: const BorderSide(color: Color(0xFFD0D9F0), width: 1),
    textTheme: buildClinicalTextTheme(
      primaryText: AppColors.clinicTextPrimary,
      secondaryText: AppColors.clinicTextSecondary,
    ),
  );

  static ThemeData get dark => _buildTheme(
    colorScheme: darkColorScheme,
    scaffoldBg: const Color(0xFF121212),
    cardBg: const Color(0xFF2A2D3E),
    hintColor: const Color(0xFFAFB3C8),
    appBarBg: const Color(0xFF1C1B1F),
    appBarForeground: AppColors.white,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    inputFill: const Color(0xFF2A2D3E),
    inputEnabledBorder: const BorderSide(color: Color(0xFF3D4160), width: 1),
    textTheme: buildClinicalTextTheme(
      primaryText: AppColors.clinicTextPrimaryDark,
      secondaryText: AppColors.clinicTextSecondaryDark,
    ),
  );

  // ─── Builder ──────────────────────────────────────────────────────────────

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required Color scaffoldBg,
    required Color cardBg,
    required Color hintColor,
    required Color appBarBg,
    required Color appBarForeground,
    required SystemUiOverlayStyle systemOverlayStyle,
    required Color inputFill,
    required BorderSide inputEnabledBorder,
    required TextTheme textTheme,
  }) {
    final primary = colorScheme.primary;
    final radius = Radius.circular(Dimensions.RADIUS_DEFAULT);

    return ThemeData(
      useMaterial3: true,
      fontFamily: AppConstants.fontFamily,
      brightness: colorScheme.brightness,
      primaryColor: primary,
      scaffoldBackgroundColor: scaffoldBg,
      cardColor: cardBg,
      hintColor: hintColor,
      disabledColor: AppColors.buttonDisabled,
      colorScheme: colorScheme,

      // ── Typography / iconography ──────────────────────────────────────────
      // Brightness-aware defaults from [buildClinicalTextTheme]: unstyled
      // `Text` and `Icon` widgets inherit the right light/dark colour.
      textTheme: textTheme,
      iconTheme: IconThemeData(
        color: textTheme.bodyLarge?.color ?? colorScheme.onSurface,
      ),

      // ── AppBar ────────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBg,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        foregroundColor: appBarForeground,
        systemOverlayStyle: systemOverlayStyle,
      ),

      // ── Card ──────────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: cardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(radius)),
      ),

      // ── Input / TextFormField ─────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeDefault,
          vertical: Dimensions.FONT_SIZE_DEFAULT,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(radius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(radius),
          borderSide: inputEnabledBorder,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(radius),
          borderSide: BorderSide(color: primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(radius),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(radius),
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
        labelStyle: TextStyle(color: hintColor),
        hintStyle: TextStyle(color: hintColor),
        floatingLabelStyle: TextStyle(color: primary),
      ),

      // ── ElevatedButton ───────────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(radius)),
        ),
      ),

      // ── TextButton ───────────────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primary),
      ),

      // ── Divider ──────────────────────────────────────────────────────────
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
      ),
    );
  }
}
