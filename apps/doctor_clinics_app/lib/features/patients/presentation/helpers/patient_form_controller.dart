import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Holds the patient form fields without rebuilding the whole dialog.
class PatientFormController {
  PatientFormController() : createdAt = DateTime.now();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final ValueNotifier<String> gender = ValueNotifier(AppConstants.genderMale);
  final ValueNotifier<String?> bloodType = ValueNotifier(null);
  final DateTime createdAt;

  Patient toPatient() {
    return Patient(
      id: 0,
      fileNumber: '',
      fullName: name.text.trim(),
      searchText: name.text.trim(),
      gender: gender.value,
      birthDate: _birthDateFromAge(),
      phone: _optional(phone.text),
      notes: _optional(notes.text),
      bloodType: bloodType.value,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }

  void dispose() {
    name.dispose();
    age.dispose();
    phone.dispose();
    notes.dispose();
    gender.dispose();
    bloodType.dispose();
  }

  /// Approximates the birth date from the entered age so the rest of the app
  /// keeps using the existing birth-date field.
  DateTime? _birthDateFromAge() {
    final years = int.tryParse(age.text.trim());
    if (years == null) return null;
    final now = DateTime.now();
    return DateTime(now.year - years, now.month, now.day);
  }

  static String? _optional(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
