import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

/// Result of one board load: either enriched rows or a readable error.
class OperationBoardLoadResult {
  const OperationBoardLoadResult.success(this.entries) : error = null;
  const OperationBoardLoadResult.failure(this.error) : entries = const [];

  final List<OperationEntry> entries;
  final String? error;

  bool get isSuccess => error == null;
}

/// Joins operations with their patient and pre-operation checklist.
///
/// Runs on the local Drift store, so the checklist queries stay cheap; callers
/// get one sorted board instead of querying from the widgets.
class OperationBoardLoader {
  const OperationBoardLoader._();

  static Future<OperationBoardLoadResult> load({
    required IOperationRepository operations,
    required PatientRepository patients,
  }) async {
    final operationsResult = await operations.getAll();
    if (operationsResult.isLeft()) {
      return OperationBoardLoadResult.failure(
        operationsResult.fold((failure) => failure.message, (_) => ''),
      );
    }

    final patientsResult = await patients.getAllPatients();
    final patientsResultRows = patientsResult.getOrElse(() => const []);
    final patientsById = {
      for (final patient in patientsResultRows) patient.id: patient,
    };

    final rows = operationsResult.getOrElse(() => const <Operation>[]);
    final entries = await Future.wait(
      rows.map((operation) => _entry(operation, patientsById, operations)),
    );
    entries.sort(_compare);

    return OperationBoardLoadResult.success(entries);
  }

  static Future<OperationEntry> _entry(
    Operation operation,
    Map<int, Patient> patientsById,
    IOperationRepository operations,
  ) async {
    final testsResult = await operations.getRequiredTests(operation.id);
    return OperationEntry(
      operation: operation,
      patient: patientsById[operation.patientId],
      tests: testsResult.getOrElse(() => const <OperationRequiredTest>[]),
    );
  }

  static int _compare(OperationEntry a, OperationEntry b) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final aDate = DateTime(
      a.operation.scheduledDate.year,
      a.operation.scheduledDate.month,
      a.operation.scheduledDate.day,
    );
    final bDate = DateTime(
      b.operation.scheduledDate.year,
      b.operation.scheduledDate.month,
      b.operation.scheduledDate.day,
    );
    final aPast = aDate.isBefore(today);
    final bPast = bDate.isBefore(today);
    if (aPast != bPast) return aPast ? 1 : -1;

    final byDate = aDate.compareTo(bDate);
    if (byDate != 0) return aPast ? -byDate : byDate;
    return (a.operation.scheduledTime ?? '').compareTo(
      b.operation.scheduledTime ?? '',
    );
  }
}
