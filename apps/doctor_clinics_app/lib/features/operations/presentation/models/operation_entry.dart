import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// One operation joined with its patient and pre-operation checklist.
///
/// The board is a read model: the operation row stays the source of truth and
/// the patient/tests are attached here so the UI never queries per card.
class OperationEntry {
  const OperationEntry({
    required this.operation,
    required this.tests,
    this.patient,
  });

  final Operation operation;
  final Patient? patient;
  final List<OperationRequiredTest> tests;

  /// Number of checklist items already marked as done.
  int get testsDone => tests.where((test) => test.isDone ?? false).length;

  /// Remaining pre-operation checks.
  int get testsPending => tests.length - testsDone;

  /// Cost still unpaid for this operation.
  int get balancePiasters =>
      (operation.totalCostPiasters ?? 0) - (operation.depositPiasters ?? 0);

  /// Whether the checklist is complete (an empty checklist counts as complete).
  bool get isReady => testsPending == 0;

  /// Whether the row still waits for a surgeon assignment.
  bool get isSurgeonMissing => (operation.surgeonName ?? '').trim().isEmpty;

  /// Whether the record carries a positive outstanding balance.
  bool get hasBalance => balancePiasters > 0;
}
