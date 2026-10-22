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

  // ── Clinical Practice Desktop (apps/doctor_clinics_app/DESIGN (2).md) ──
  // Light values come straight from the DESIGN palette. Dark values reuse the
  // DESIGN `inverse-*` tokens where available, otherwise tonal derivations.
  static const Color clinicBackground = Color(0xFFF8F9FF);
  static const Color clinicBackgroundDark = Color(0xFF10161D);
  static const Color clinicSurfaceContainerLow = Color(0xFFEFF4FF);
  static const Color clinicSurfaceContainer = Color(0xFFE5EEFF);
  static const Color clinicSurfaceContainerDark = Color(0xFF1E2833);
  static const Color clinicTextPrimary = Color(0xFF0B1C30);
  static const Color clinicTextPrimaryDark = Color(0xFFEAF1FF);
  static const Color clinicTextSecondary = Color(0xFF3E4947);
  static const Color clinicTextSecondaryDark = Color(0xFFBDC9C6);
  static const Color clinicBorder = Color(0xFFD9E2E8);
  static const Color clinicBorderDark = Color(0xFF2C3A47);
  static const Color clinicPrimary = Color(0xFF005C55);
  static const Color clinicPrimaryContainer = Color(0xFF0F766E);
  static const Color clinicOnPrimaryContainer = Color(0xFFA3FAEF);
  static const Color clinicInversePrimary = Color(0xFF80D5CB);
  // Side nav active-item tint (DESIGN (2).md: Primary Container `#D5F0EC`).
  static const Color clinicPrimaryContainerTint = Color(0xFFD5F0EC);
  static const Color clinicPrimaryContainerTintDark = Color(0xFF143732);
  static const Color clinicSecondary = Color(0xFF0051D5);
  static const Color clinicError = Color(0xFFBA1A1A);
  static const Color clinicErrorContainer = Color(0xFFFFDAD6);

  // Clinic semantic status colors
  static const Color clinicStatusBooked = Color(0xFF2563EB);
  static const Color clinicStatusBookedBg = Color(0xFFEFF6FF);
  static const Color clinicStatusBookedBorder = Color(0xFFBFDBFE);

  static const Color clinicStatusWaiting = Color(0xFFB45309);
  static const Color clinicStatusWaitingBg = Color(0xFFFEF3C7);
  static const Color clinicStatusWaitingBorder = Color(0xFFFDE68A);

  static const Color clinicStatusCurrent = Color(0xFF0F766E);
  static const Color clinicStatusCurrentBg = Color(0xFFD5F0EC);
  static const Color clinicStatusCurrentBorder = Color(0xFF99F6E4);

  static const Color clinicStatusDone = Color(0xFF15803D);
  static const Color clinicStatusDoneBg = Color(0xFFDCFCE7);
  static const Color clinicStatusDoneBorder = Color(0xFFBBF7D0);

  static const Color clinicStatusCancelled = Color(0xFF64748B);
  static const Color clinicStatusCancelledBg = Color(0xFFF1F5F9);
  static const Color clinicStatusCancelledBorder = Color(0xFFE2E8F0);

  static const Color clinicStatusUrgent = Color(0xFFB91C1C);
  static const Color clinicStatusUrgentBg = Color(0xFFFEE2E2);
  static const Color clinicStatusUrgentBorder = Color(0xFFFECACA);

  // Dark-mode counterparts of the clinic status tokens above.
  // Surfaces/borders are deep tinted versions of the light pastels and the
  // foregrounds are lifted so pills and list cards keep their contrast on a
  // dark card (clinicSurfaceContainerDark). Resolve through the `clinicStatus*`
  // BuildContext getters in color_extensions.dart — never use these directly.
  static const Color clinicStatusBookedDark = Color(0xFF8AB4FF);
  static const Color clinicStatusBookedBgDark = Color(0xFF16233C);
  static const Color clinicStatusBookedBorderDark = Color(0xFF28406B);

  static const Color clinicStatusWaitingDark = Color(0xFFF0B458);
  static const Color clinicStatusWaitingBgDark = Color(0xFF3A2C0E);
  static const Color clinicStatusWaitingBorderDark = Color(0xFF6B4E18);

  static const Color clinicStatusCurrentDark = Color(0xFF5FE0CE);
  static const Color clinicStatusCurrentBgDark = Color(0xFF0E3A34);
  static const Color clinicStatusCurrentBorderDark = Color(0xFF1B6157);

  static const Color clinicStatusDoneDark = Color(0xFF7BDDA3);
  static const Color clinicStatusDoneBgDark = Color(0xFF12301E);
  static const Color clinicStatusDoneBorderDark = Color(0xFF245A38);

  static const Color clinicStatusCancelledDark = Color(0xFFA7B4C2);
  static const Color clinicStatusCancelledBgDark = Color(0xFF1F2A36);
  static const Color clinicStatusCancelledBorderDark = Color(0xFF354553);

  static const Color clinicStatusUrgentDark = Color(0xFFF08585);
  static const Color clinicStatusUrgentBgDark = Color(0xFF3A1618);
  static const Color clinicStatusUrgentBorderDark = Color(0xFF7A2E31);
}
