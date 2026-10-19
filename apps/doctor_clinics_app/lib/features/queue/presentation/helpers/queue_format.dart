import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class QueueFormat {
  QueueFormat._();

  static String money(int piasters, BuildContext context) {
    final value = (piasters / 100).toStringAsFixed(2);
    final formatted = value.endsWith('.00')
        ? value.substring(0, value.length - 3)
        : value;
    final digits = DateConverter.withLocalizedDigits(
      formatted,
      context.locale.toString(),
    );
    return '$digits ج.م.';
  }

  static String localizedNumber(int number, BuildContext context) {
    return DateConverter.withLocalizedDigits(
      number.toString(),
      context.locale.toString(),
    );
  }

  static String localizedTime(DateTime time, BuildContext context) {
    final formatted = DateFormat.jm(context.locale.toString()).format(time);
    return DateConverter.withLocalizedDigits(
      formatted,
      context.locale.toString(),
    );
  }
}
