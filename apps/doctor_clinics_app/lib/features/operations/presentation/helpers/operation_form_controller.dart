import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_validators.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

/// Holds the new-operation form values without rebuilding the whole modal.
class OperationFormController {
  OperationFormController() {
    loadPatients();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController surgeon = TextEditingController();
  final TextEditingController cost = TextEditingController();
  final TextEditingController deposit = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final TextEditingController testName = TextEditingController();

  final ValueNotifier<int?> patientId = ValueNotifier(null);
  final ValueNotifier<List<Patient>> patients = ValueNotifier(const []);
  final ValueNotifier<bool> patientsLoaded = ValueNotifier(false);
  final ValueNotifier<DateTime> date = ValueNotifier(_today());
  final ValueNotifier<TimeOfDay?> time = ValueNotifier(TimeOfDay.now());
  final ValueNotifier<List<String>> tests = ValueNotifier(const []);

  bool _disposed = false;

  Future<void> loadPatients() async {
    final result = await getIt<PatientRepository>().getAllPatients();
    if (_disposed) return;
    patients.value = result.getOrElse(() => const []);
    patientsLoaded.value = true;
  }

  /// Adds the typed test name; returns a translation key on failure.
  String? addTest() {
    final value = testName.text.trim();
    if (value.isEmpty) return 'operation_form.test_required';
    if (tests.value.contains(value)) return 'operation_form.test_duplicate';
    tests.value = [...tests.value, value];
    testName.clear();
    return null;
  }

  void removeTest(String value) {
    tests.value = tests.value.where((test) => test != value).toList();
  }

  Operation toOperation() {
    final now = DateTime.now();
    return Operation(
      id: 0,
      patientId: patientId.value!,
      name: name.text.trim(),
      scheduledDate: date.value,
      scheduledTime: _formatTime(time.value),
      surgeonName: surgeon.text.trim().isEmpty ? null : surgeon.text.trim(),
      notes: notes.text.trim().isEmpty ? null : notes.text.trim(),
      status: AppConstants.operationStatusScheduled,
      depositPiasters: OperationFormValidators.toPiasters(deposit.text),
      totalCostPiasters: OperationFormValidators.toPiasters(cost.text),
      createdBy: 0,
      createdAt: now,
      updatedAt: now,
    );
  }

  void dispose() {
    _disposed = true;
    name.dispose();
    surgeon.dispose();
    cost.dispose();
    deposit.dispose();
    notes.dispose();
    testName.dispose();
    patientId.dispose();
    patients.dispose();
    patientsLoaded.dispose();
    date.dispose();
    time.dispose();
    tests.dispose();
  }

  static DateTime _today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String? _formatTime(TimeOfDay? value) {
    if (value == null) return null;
    final hour = value.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
