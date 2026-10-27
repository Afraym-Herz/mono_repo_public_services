import 'package:doctor_clinics_app/core/database/daos/operation_dao.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_mapper.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart'
    as entity;
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart'
    as entity;

/// Read queries of [OperationDriftDatasource], kept apart from its writes.
mixin OperationDriftReads {
  OperationDao get dao;

  Future<List<entity.Operation>> fetchAll() async {
    final rows = await dao.getAllOperations();
    return rows.map(OperationMapper.toDomainOperation).toList();
  }

  Future<List<entity.Operation>> fetchByPatient(int patientId) async {
    final rows = await dao.getOperationsForPatient(patientId);
    return rows.map(OperationMapper.toDomainOperation).toList();
  }

  Future<List<entity.Operation>> fetchUpcoming() async {
    final rows = await dao.getUpcomingOperations();
    return rows.map(OperationMapper.toDomainOperation).toList();
  }

  Future<List<entity.OperationRequiredTest>> fetchRequiredTests(
    int operationId,
  ) async {
    final rows = await dao.getTestsForOperation(operationId);
    return rows.map(OperationMapper.toDomainTest).toList();
  }
}
