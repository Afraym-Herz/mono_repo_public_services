import 'package:doctor_clinics_app/core/database/daos/operation_dao.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_datasource.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';

/// Drift-backed stub of [IOperationDatasource].
class OperationDriftDatasource implements IOperationDatasource {
  final OperationDao dao;
  OperationDriftDatasource(this.dao);

  @override
  Future<List<Operation>> fetchAll() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<Operation>> fetchByPatient(int patientId) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<Operation>> fetchUpcoming() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> insert(Operation operation) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> update(Operation operation) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> softDelete(int id) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<OperationRequiredTest>> fetchRequiredTests(int operationId) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> insertRequiredTest(OperationRequiredTest test) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> updateRequiredTest(OperationRequiredTest test) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRequiredTest(int id) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }
}
