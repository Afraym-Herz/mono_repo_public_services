import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_range.dart';

/// Presentation formatting for the accounts dashboard.
class BillingFormat {
  BillingFormat._();

  /// `٢,٠٨٣.٠٠` — grouped amount without the currency.
  static String amount(int piasters, BuildContext context) {
    final value = NumberFormat('#,##0.00', 'en').format(piasters / 100);
    return _digits(value, context);
  }

  /// `٢٬٠٨٣٫٠٠ ج.م.` — amount with the localized currency.
  static String money(int piasters, BuildContext context) =>
      '${amount(piasters, context)} ${'billing.currency'.tr()}';

  /// `٦٢٪` — whole percentage.
  static String percent(double ratio, BuildContext context) {
    final symbol = context.locale.languageCode == 'ar' ? '٪' : '%';
    return '${_digits((ratio * 100).round().toString(), context)}$symbol';
  }

  /// Localized count.
  static String number(int value, BuildContext context) =>
      _digits(value.toString(), context);

  /// Localizes digits inside an already-formatted label (`24/10`).
  static String digits(String value, BuildContext context) =>
      _digits(value, context);

  /// Clock time for ledger cells (`٩:٣٠ ص`).
  static String time(DateTime value, BuildContext context) =>
      DateConverter.localizedTime(value, context.locale.toString());

  /// Compact date for expense/report cells (`٢٤ أكتوبر`).
  static String date(DateTime value, BuildContext context) =>
      DateConverter.localizedShortDate(value, context.locale.toString());

  /// Label for a [BillingRange] pill.
  static String rangeLabel(BillingRange range) => switch (range) {
    BillingRange.today => 'billing_range.today'.tr(),
    BillingRange.week => 'billing_range.week'.tr(),
    BillingRange.month => 'billing_range.month'.tr(),
  };

  /// Localized invoice-status label.
  static String invoiceStatus(String status) => switch (status) {
    AppConstants.invoiceStatusPaid => 'billing.status.paid'.tr(),
    AppConstants.invoiceStatusPartiallyPaid =>
      'billing.status.partially_paid'.tr(),
    AppConstants.invoiceStatusCancelled => 'billing.status.cancelled'.tr(),
    _ => 'billing.status.pending'.tr(),
  };

  static String _digits(String value, BuildContext context) =>
      DateConverter.withLocalizedDigits(value, context.locale.toString());
}
