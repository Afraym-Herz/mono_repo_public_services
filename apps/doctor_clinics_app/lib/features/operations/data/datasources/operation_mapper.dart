import 'package:core/core.dart';
import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart'
    as entity;
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart'
    as entity;

/// Pure Drift row ↔ entity/companion mapping for operations and their tests.
class OperationMapper {
  const OperationMapper._();

  /// Maps an [Operation] row to its domain entity.
  static entity.Operation toDomainOperation(Operation row) {
    return entity.Operation(
      id: row.id,
      patientId: row.patientId,
      name: row.operationType,
      scheduledDate: row.scheduledDate,
      notes: row.notes,
      status: row.status,
      depositPiasters: row.depositAmount,
      totalCostPiasters: row.cost,
      createdBy: 0,
      createdAt: row.scheduledDate,
      updatedAt: row.scheduledDate,
    );
  }

  /// Maps an [entity.Operation] to an [OperationsCompanion].
  static OperationsCompanion toOperationCompanion(entity.Operation op) {
    return OperationsCompanion(
      id: op.id > 0 ? Value(op.id) : const Value.absent(),
      patientId: Value(op.patientId),
      operationType: Value(op.name),
      scheduledDate: Value(op.scheduledDate),
      notes: Value(op.notes),
      status: Value(op.status ?? AppConstants.operationStatusScheduled),
      cost: Value(op.totalCostPiasters ?? 0),
      depositAmount: Value(op.depositPiasters ?? 0),
    );
  }

  /// Maps an [entity.OperationRequiredTest] to an insert [companion].
  static OperationRequiredTestsCompanion toTestInsertCompanion(
    entity.OperationRequiredTest test,
  ) {
    return OperationRequiredTestsCompanion(
      id: test.id > 0 ? Value(test.id) : const Value.absent(),
      operationId: Value(test.operationId),
      testName: Value(test.testName),
      isCompleted: Value(test.isDone ?? false),
      notes: Value(test.notes),
    );
  }

  /// Maps an [entity.OperationRequiredTest] to an update [companion].
  static OperationRequiredTestsCompanion toTestUpdateCompanion(
    entity.OperationRequiredTest test,
  ) {
    return OperationRequiredTestsCompanion(
      id: Value(test.id),
      operationId: Value(test.operationId),
      testName: Value(test.testName),
      isCompleted: Value(test.isDone ?? false),
      notes: Value(test.notes),
    );
  }

  /// Maps an [OperationRequiredTest] row to its domain entity.
  static entity.OperationRequiredTest toDomainTest(OperationRequiredTest row) {
    return entity.OperationRequiredTest(
      id: row.id,
      operationId: row.operationId,
      testName: row.testName,
      isDone: row.isCompleted,
      notes: row.notes,
    );
  }
}
