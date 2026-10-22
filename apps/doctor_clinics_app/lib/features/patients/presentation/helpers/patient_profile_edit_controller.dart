import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/helpers/patient_search_text.dart';

/// Draft state for the profile card's pencil mode.
///
/// Holds the prefilled fields, the read-only source patient and the edit flag.
/// Text fields keep their own controllers so typing never rebuilds the card.
class PatientProfileEditController {
  PatientProfileEditController(Patient patient)
    : _original = patient,
      name = TextEditingController(text: patient.fullName),
      age = TextEditingController(text: patient.age?.toString() ?? ''),
      phone = TextEditingController(text: patient.phone ?? ''),
      notes = TextEditingController(text: patient.notes ?? ''),
      gender = ValueNotifier(patient.gender),
      bloodType = ValueNotifier(patient.bloodType);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name;
  final TextEditingController age;
  final TextEditingController phone;
  final TextEditingController notes;
  final ValueNotifier<String> gender;
  final ValueNotifier<String?> bloodType;
  final ValueNotifier<bool> isEditing = ValueNotifier(false);

  Patient _original;
  bool didSave = false;

  bool validate() => formKey.currentState?.validate() ?? false;

  /// Builds the edited row from the loaded patient so the file number, dates
  /// and any legacy columns are preserved.
  Patient toPatient() {
    final fullName = name.text.trim();
    final phoneValue = _optional(phone.text);
    return _original.copyWith(
      fullName: fullName,
      searchText: PatientSearchText.of(fullName: fullName, phone: phoneValue),
      gender: gender.value,
      age: int.tryParse(age.text.trim()),
      phone: phoneValue,
      notes: _optional(notes.text),
      bloodType: bloodType.value,
      updatedAt: DateTime.now(),
    );
  }

  void startEditing() {
    _sync(_original);
    isEditing.value = true;
  }

  void cancel() {
    _sync(_original);
    isEditing.value = false;
  }

  void finishSave(Patient patient) {
    _original = patient;
    didSave = true;
    _sync(patient);
    isEditing.value = false;
  }

  /// Keeps the draft in step with a patient reloaded from the database.
  void syncOriginal(Patient patient) {
    _original = patient;
    if (!isEditing.value) _sync(patient);
  }

  void _sync(Patient patient) {
    name.text = patient.fullName;
    age.text = patient.age?.toString() ?? '';
    phone.text = patient.phone ?? '';
    notes.text = patient.notes ?? '';
    gender.value = patient.gender;
    bloodType.value = patient.bloodType;
  }

  static String? _optional(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  void dispose() {
    name.dispose();
    age.dispose();
    phone.dispose();
    notes.dispose();
    gender.dispose();
    bloodType.dispose();
    isEditing.dispose();
  }
}
