import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_datasource.dart';

class OperationRepositoryImpl implements IOperationRepository {
  final IOperationDatasource datasource;

  OperationRepositoryImpl({required this.datasource});

  @override
  Future<List<Operation>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<List<Operation>> getByPatient(int patientId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Operation>> getUpcoming() {
    throw UnimplementedError();
  }

  @override
  Future<Operation> create(Operation operation) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(Operation operation) {
    throw UnimplementedError();
  }

  @override
  Future<void> softDelete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<OperationRequiredTest>> getRequiredTests(
    int operationId,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<void> addRequiredTest(OperationRequiredTest test) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateRequiredTest(
    OperationRequiredTest test,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRequiredTest(int id) {
    throw UnimplementedError();
  }
}