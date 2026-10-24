import 'package:core/core.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

/// Loads the patient list used by the invoice form's picker.
class InvoicePatientSource {
  InvoicePatientSource() {
    _future = _load();
  }

  late Future<List<Patient>> _future;
  List<Patient>? _lastPatients;

  Future<List<Patient>> get patients => _future;

  /// Last loaded list, kept so a newly created patient can appear instantly.
  List<Patient>? get lastPatients => _lastPatients;

  /// Prepends a patient created from the invoice flow.
  void add(Patient patient) {
    _lastPatients = [
      patient,
      ...?_lastPatients?.where((item) => item.id != patient.id),
    ];
    _future = Future.value(_lastPatients);
  }

  Future<List<Patient>> _load() async {
    final result = await getIt<PatientRepository>().getAllPatients();
    final loaded = result.fold((_) => <Patient>[], (list) => list);
    final added = _lastPatients ?? const <Patient>[];
    // Keep a patient created before the initial load finished.
    _lastPatients = [
      ...added.where((patient) => !loaded.any((item) => item.id == patient.id)),
      ...loaded,
    ];
    return _lastPatients!;
  }
}
