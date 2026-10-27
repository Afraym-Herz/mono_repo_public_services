import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Resolved foreground/background/border trio for a status pill.
class FinanceStatusColors {
  const FinanceStatusColors({
    required this.foreground,
    required this.background,
    required this.border,
  });

  final Color foreground;
  final Color background;
  final Color border;
}

/// Colour and glyph mappings shared by the ledger and expense badges.
class FinanceBadgeStyle {
  FinanceBadgeStyle._();

  /// Invoice status palette, brightness-aware.
  static FinanceStatusColors status(BuildContext context, String status) {
    return switch (status) {
      AppConstants.invoiceStatusPaid => _colors(
        context.clinicStatusDone,
        context.clinicStatusDoneBg,
        context.clinicStatusDoneBorder,
      ),
      AppConstants.invoiceStatusPartiallyPaid => _colors(
        context.clinicStatusBooked,
        context.clinicStatusBookedBg,
        context.clinicStatusBookedBorder,
      ),
      AppConstants.invoiceStatusCancelled => _colors(
        context.clinicStatusCancelled,
        context.clinicStatusCancelledBg,
        context.clinicStatusCancelledBorder,
      ),
      _ => _colors(
        context.clinicStatusWaiting,
        context.clinicStatusWaitingBg,
        context.clinicStatusWaitingBorder,
      ),
    };
  }

  static FinanceStatusColors _colors(Color fg, Color bg, Color border) =>
      FinanceStatusColors(foreground: fg, background: bg, border: border);
}
