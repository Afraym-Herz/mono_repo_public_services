import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Presentation formatting for the patients register cells.
class PatientRowFormat {
  PatientRowFormat._();

  /// `٣٨ سنة / ذكر` (age from [patient]'s birth date plus the gender label).
  static String ageGender(Patient patient, BuildContext context) =>
      '${age(patient, context)} / ${gender(patient)}';

  /// `٣٨ سنة` — age in years from [patient]'s birth date, or `—` when unknown.
  static String age(Patient patient, BuildContext context) {
    final birthDate = patient.birthDate;
    if (birthDate == null) return 'patients.table.none'.tr();
    return _ageLabel(_yearsSince(birthDate), context);
  }

  /// Localized gender label (`ذكر` / `أنثى`).
  static String gender(Patient patient) => _genderKey(patient.gender).tr();

  static String _ageLabel(int years, BuildContext context) {
    final age = _localizedDigits('$years', context);
    return 'patients.age_years'.tr(namedArgs: {'count': age});
  }

  /// `١ أكتوبر ٢٠٢٦` — day, month and year in the active locale.
  static String date(DateTime value, BuildContext context) {
    final locale = context.locale.toString();
    return _localizedDigits(
      DateFormat('d MMMM yyyy', locale).format(value),
      context,
    );
  }

  /// `٣٠ ج.م.` — integer piasters rendered as whole currency units.
  static String money(int piasters, BuildContext context) {
    final value = (piasters / 100).toStringAsFixed(2);
    final trimmed = value.endsWith('.00')
        ? value.substring(0, value.length - 3)
        : value;
    return '${_localizedDigits(trimmed, context)} ${'patients.currency'.tr()}';
  }

  static int _yearsSince(DateTime birthDate) {
    final now = DateTime.now();
    var years = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      years--;
    }
    return years < 0 ? 0 : years;
  }

  static String _genderKey(String gender) =>
      gender.toLowerCase() == AppConstants.genderFemale
      ? 'patients.gender_female'
      : 'patients.gender_male';

  static String _localizedDigits(String value, BuildContext context) =>
      DateConverter.withLocalizedDigits(value, context.locale.toString());
}
