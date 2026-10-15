import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/operation_dao.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_datasource.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart'
    as entity;
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart'
    as entity;

/// Concrete Drift implementation of [IOperationDatasource].
class OperationDriftDatasource implements IOperationDatasource {
  final OperationDao dao;

  OperationDriftDatasource(this.dao);

  @override
  Future<List<entity.Operation>> fetchAll() async {
    final rows = await dao.getAllOperations();
    return rows.map(_toDomainOperation).toList();
  }

  @override
  Future<List<entity.Operation>> fetchByPatient(int patientId) async {
    final rows = await dao.getOperationsForPatient(patientId);
    return rows.map(_toDomainOperation).toList();
  }

  @override
  Future<List<entity.Operation>> fetchUpcoming() async {
    final rows = await dao.getUpcomingOperations();
    return rows.map(_toDomainOperation).toList();
  }

  @override
  Future<int> insert(entity.Operation operation) async {
    return dao.insertOperation(_toOperationCompanion(operation));
  }

  @override
  Future<void> update(entity.Operation operation) async {
    await dao.updateOperation(_toOperationCompanion(operation));
  }

  @override
  Future<void> softDelete(int id) async {
    await dao.deleteOperation(id);
  }

  @override
  Future<List<entity.OperationRequiredTest>> fetchRequiredTests(
    int operationId,
  ) async {
    final rows = await dao.getTestsForOperation(operationId);
    return rows.map(_toDomainTest).toList();
  }

  @override
  Future<void> insertRequiredTest(entity.OperationRequiredTest test) async {
    await dao.insertTest(
      OperationRequiredTestsCompanion(
        id: test.id > 0 ? Value(test.id) : const Value.absent(),
        operationId: Value(test.operationId),
        testName: Value(test.testName),
        isCompleted: Value(test.isDone ?? false),
        notes: Value(test.notes),
      ),
    );
  }

  @override
  Future<void> updateRequiredTest(entity.OperationRequiredTest test) async {
    await dao.updateTest(
      OperationRequiredTestsCompanion(
        id: Value(test.id),
        operationId: Value(test.operationId),
        testName: Value(test.testName),
        isCompleted: Value(test.isDone ?? false),
        notes: Value(test.notes),
      ),
    );
  }

  @override
  Future<void> deleteRequiredTest(int id) async {
    await dao.deleteTest(id);
  }

  entity.Operation _toDomainOperation(Operation row) {
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

  OperationsCompanion _toOperationCompanion(entity.Operation op) {
    return OperationsCompanion(
      id: op.id > 0 ? Value(op.id) : const Value.absent(),
      patientId: Value(op.patientId),
      operationType: Value(op.name),
      scheduledDate: Value(op.scheduledDate),
      notes: Value(op.notes),
      status: Value(op.status ?? 'scheduled'),
      cost: Value(op.totalCostPiasters ?? 0),
      depositAmount: Value(op.depositPiasters ?? 0),
    );
  }

  entity.OperationRequiredTest _toDomainTest(OperationRequiredTest row) {
    return entity.OperationRequiredTest(
      id: row.id,
      operationId: row.operationId,
      testName: row.testName,
      isDone: row.isCompleted,
      notes: row.notes,
    );
  }
}
