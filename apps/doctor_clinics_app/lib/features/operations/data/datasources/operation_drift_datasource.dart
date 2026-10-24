import 'package:doctor_clinics_app/core/database/daos/operation_dao.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_datasource.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_mapper.dart';
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
    return rows.map(OperationMapper.toDomainOperation).toList();
  }

  @override
  Future<List<entity.Operation>> fetchByPatient(int patientId) async {
    final rows = await dao.getOperationsForPatient(patientId);
    return rows.map(OperationMapper.toDomainOperation).toList();
  }

  @override
  Future<List<entity.Operation>> fetchUpcoming() async {
    final rows = await dao.getUpcomingOperations();
    return rows.map(OperationMapper.toDomainOperation).toList();
  }

  @override
  Future<int> insert(entity.Operation operation) async {
    return dao.insertOperation(OperationMapper.toOperationCompanion(operation));
  }

  @override
  Future<int> insertWithTests(
    entity.Operation operation,
    List<String> testNames,
  ) {
    final names = testNames
        .map((name) => name.trim())
        .where((name) => name.isNotEmpty)
        .toList();
    return dao.insertOperationWithTests(
      OperationMapper.toOperationCompanion(operation),
      names,
    );
  }

  @override
  Future<void> update(entity.Operation operation) async {
    await dao.updateOperation(OperationMapper.toOperationCompanion(operation));
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
    return rows.map(OperationMapper.toDomainTest).toList();
  }

  @override
  Future<void> insertRequiredTest(entity.OperationRequiredTest test) async {
    await dao.insertTest(OperationMapper.toTestInsertCompanion(test));
  }

  @override
  Future<void> updateRequiredTest(entity.OperationRequiredTest test) async {
    await dao.updateTest(OperationMapper.toTestUpdateCompanion(test));
  }

  @override
  Future<void> deleteRequiredTest(int id) async {
    await dao.deleteTest(id);
  }
}
