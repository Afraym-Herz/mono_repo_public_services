import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Locale-aware formatters for the operations board.
class OperationFormat {
  const OperationFormat._();

  static String count(int value, BuildContext context) =>
      DateConverter.withLocalizedDigits('$value', context.locale.toString());

  static String money(int piasters, BuildContext context) {
    final value = (piasters / 100).toStringAsFixed(2);
    final trimmed = value.endsWith('.00')
        ? value.substring(0, value.length - 3)
        : value;
    final digits = DateConverter.withLocalizedDigits(
      trimmed,
      context.locale.toString(),
    );
    return '$digits ${'operations_board.currency'.tr()}';
  }

  static String date(DateTime date, BuildContext context) =>
      DateConverter.localizedWeekdayDate(date, context.locale.toString());

  static String time(Operation operation, BuildContext context) {
    final slot = operation.scheduledTime?.trim();
    final localeTag = context.locale.toString();
    if (slot != null && slot.isNotEmpty) {
      return DateConverter.localizedSlot(slot, localeTag);
    }
    return DateConverter.localizedTime(operation.scheduledDate, localeTag);
  }

  static String age(Patient? patient, BuildContext context) {
    if (patient == null) return 'operations_board.patient.none'.tr();
    final age = patient.age;
    if (age == null) return 'operations_board.patient.none'.tr();
    return 'operations_board.patient.age_value'.tr(
      namedArgs: {'count': count(age, context)},
    );
  }

  static String fileNumber(Patient? patient, BuildContext context) {
    if (patient == null) return 'operations_board.patient.none'.tr();
    return DateConverter.withLocalizedDigits(
      patient.fileNumber,
      context.locale.toString(),
    );
  }

  static String gender(Patient? patient) {
    if (patient == null) return 'operations_board.patient.none'.tr();
    return patient.gender == AppConstants.genderFemale
        ? 'operations_board.patient.female'.tr()
        : 'operations_board.patient.male'.tr();
  }
}
