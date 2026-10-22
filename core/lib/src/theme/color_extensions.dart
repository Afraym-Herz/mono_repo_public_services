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

  /// Card surface — brightness-aware.
  ///
  /// This is the single source for every card/list-card surface: light cards
  /// stay white, dark cards use the clinic dark container so nothing renders
  /// light-on-light in dark mode.
  Color get cardColor => clinicIsDark
      ? AppColors.clinicSurfaceContainerDark
      : AppColors.backgroundCard;

  /// Surface layered *on top of* a card (chips, insets). Keeps a visible step
  /// away from [cardColor] in both modes.
  Color get clinicInset => clinicIsDark
      ? AppColors.inputFillDark
      : AppColors.clinicSurfaceContainerLow;

  Color get surfaceColor => AppColors.surfaceLight;

  // Interactive Colors
  Color get buttonPrimaryColor => AppColors.buttonPrimary;
  Color get buttonSecondaryColor => AppColors.buttonSecondary;
  Color get buttonDisabledColor => AppColors.buttonDisabled;

  // Clinical Practice Desktop tokens (DESIGN (2).md) — brightness-aware.
  bool get clinicIsDark => Theme.of(this).brightness == Brightness.dark;
  Color get clinicBackground => clinicIsDark
      ? AppColors.clinicBackgroundDark
      : AppColors.clinicBackground;
  Color get clinicContainer => clinicIsDark
      ? AppColors.clinicSurfaceContainerDark
      : AppColors.clinicSurfaceContainerLow;
  Color get clinicBorder =>
      clinicIsDark ? AppColors.clinicBorderDark : AppColors.clinicBorder;
  Color get clinicTextPrimary => clinicIsDark
      ? AppColors.clinicTextPrimaryDark
      : AppColors.clinicTextPrimary;
  Color get clinicTextSecondary => clinicIsDark
      ? AppColors.clinicTextSecondaryDark
      : AppColors.clinicTextSecondary;
  Color get clinicPrimary => AppColors.clinicPrimary;
  Color get clinicPrimaryContainer => clinicIsDark
      ? AppColors.clinicSurfaceContainerDark
      : AppColors.clinicSurfaceContainerLow;
  Color get clinicAccent => clinicIsDark
      ? AppColors.clinicInversePrimary
      : AppColors.clinicPrimaryContainer;
  Color get clinicSubmitButton => AppColors.clinicPrimaryContainer;

  /// Primary tone for glyphs drawn on a surface — circled queue numbers,
  /// appointment numbers, outlined row actions, icons.
  ///
  /// Light mode keeps the deep clinical primary; dark mode lifts it to the
  /// DESIGN `inverse-primary`, because `clinicPrimary` is nearly black on a
  /// dark card and the glyph stops reading.
  Color get clinicPrimaryInk =>
      clinicIsDark ? AppColors.clinicInversePrimary : AppColors.clinicPrimary;

  /// Ink drawn *on top of* a filled [clinicAccent] / primary chip (the circled
  /// "current patient" number).
  ///
  /// The accent flips to a light teal in dark mode, so white — which light
  /// mode uses on the deep teal — would wash out; dark mode needs the deep
  /// ink instead.
  Color get clinicOnAccent =>
      clinicIsDark ? AppColors.clinicTextPrimary : AppColors.white;

  /// Destructive counterpart of [clinicPrimaryInk] for outlined actions: the
  /// light `clinicError` is too dark on a dark surface, so dark mode uses the
  /// brighter error tone.
  Color get clinicActionDanger =>
      clinicIsDark ? AppColors.errorLight : AppColors.clinicError;

  /// Muted label/border of a disabled or submitting outlined action —
  /// brightness-aware so the dimmed state stays legible in both modes.
  Color get clinicActionMuted =>
      clinicIsDark ? AppColors.clinicTextSecondaryDark : AppColors.textHint;
  Color get clinicActionMutedBorder =>
      clinicIsDark ? AppColors.clinicBorderDark : AppColors.borderPrimary;

  /// Active side-nav item background (tinted primary container).
  Color get clinicNavActiveBackground => clinicIsDark
      ? AppColors.clinicPrimaryContainerTintDark
      : AppColors.clinicPrimaryContainerTint;

  // ── Clinic status colors — brightness-aware ──────────────────────────────
  // Single source for every status pill/chip/card tint. Light mode keeps the
  // original pastel palette; dark mode swaps in the *Dark tokens.
  Color get clinicStatusBooked => clinicIsDark
      ? AppColors.clinicStatusBookedDark
      : AppColors.clinicStatusBooked;
  Color get clinicStatusBookedBg => clinicIsDark
      ? AppColors.clinicStatusBookedBgDark
      : AppColors.clinicStatusBookedBg;
  Color get clinicStatusBookedBorder => clinicIsDark
      ? AppColors.clinicStatusBookedBorderDark
      : AppColors.clinicStatusBookedBorder;

  Color get clinicStatusWaiting => clinicIsDark
      ? AppColors.clinicStatusWaitingDark
      : AppColors.clinicStatusWaiting;
  Color get clinicStatusWaitingBg => clinicIsDark
      ? AppColors.clinicStatusWaitingBgDark
      : AppColors.clinicStatusWaitingBg;
  Color get clinicStatusWaitingBorder => clinicIsDark
      ? AppColors.clinicStatusWaitingBorderDark
      : AppColors.clinicStatusWaitingBorder;

  Color get clinicStatusCurrent => clinicIsDark
      ? AppColors.clinicStatusCurrentDark
      : AppColors.clinicStatusCurrent;
  Color get clinicStatusCurrentBg => clinicIsDark
      ? AppColors.clinicStatusCurrentBgDark
      : AppColors.clinicStatusCurrentBg;
  Color get clinicStatusCurrentBorder => clinicIsDark
      ? AppColors.clinicStatusCurrentBorderDark
      : AppColors.clinicStatusCurrentBorder;

  Color get clinicStatusDone => clinicIsDark
      ? AppColors.clinicStatusDoneDark
      : AppColors.clinicStatusDone;
  Color get clinicStatusDoneBg => clinicIsDark
      ? AppColors.clinicStatusDoneBgDark
      : AppColors.clinicStatusDoneBg;
  Color get clinicStatusDoneBorder => clinicIsDark
      ? AppColors.clinicStatusDoneBorderDark
      : AppColors.clinicStatusDoneBorder;

  Color get clinicStatusCancelled => clinicIsDark
      ? AppColors.clinicStatusCancelledDark
      : AppColors.clinicStatusCancelled;
  Color get clinicStatusCancelledBg => clinicIsDark
      ? AppColors.clinicStatusCancelledBgDark
      : AppColors.clinicStatusCancelledBg;
  Color get clinicStatusCancelledBorder => clinicIsDark
      ? AppColors.clinicStatusCancelledBorderDark
      : AppColors.clinicStatusCancelledBorder;

  Color get clinicStatusUrgent => clinicIsDark
      ? AppColors.clinicStatusUrgentDark
      : AppColors.clinicStatusUrgent;
  Color get clinicStatusUrgentBg => clinicIsDark
      ? AppColors.clinicStatusUrgentBgDark
      : AppColors.clinicStatusUrgentBg;
  Color get clinicStatusUrgentBorder => clinicIsDark
      ? AppColors.clinicStatusUrgentBorderDark
      : AppColors.clinicStatusUrgentBorder;
}
