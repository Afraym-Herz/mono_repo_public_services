import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Locale-aware patient counts for the patients header (`١٬٢٣٤` / `1,234`).
class PatientsCountFormat {
  PatientsCountFormat._();

  static String count(int count, BuildContext context) {
    final locale = context.locale.toString();
    final formatted = NumberFormat.decimalPattern(locale).format(count);
    return DateConverter.withLocalizedDigits(formatted, locale);
  }
}
