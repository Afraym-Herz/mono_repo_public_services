import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/helpers/patient_search_text.dart';

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
    final fullName = name.text.trim();
    final phoneValue = _optional(phone.text);
    return Patient(
      id: 0,
      fileNumber: '',
      fullName: fullName,
      searchText: PatientSearchText.of(fullName: fullName, phone: phoneValue),
      gender: gender.value,
      age: int.tryParse(age.text.trim()),
      phone: phoneValue,
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

  static String? _optional(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
