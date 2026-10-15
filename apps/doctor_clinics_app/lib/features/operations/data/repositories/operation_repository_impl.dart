import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_datasource.dart';

class OperationRepositoryImpl implements IOperationRepository {
  final IOperationDatasource datasource;

  OperationRepositoryImpl({required this.datasource});

  @override
  FutureResult<List<Operation>> getAll() async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('operations.getAll failed: $e'));
    }
  }

  @override
  FutureResult<List<Operation>> getByPatient(int patientId) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('operations.getByPatient failed: $e'));
    }
  }

  @override
  FutureResult<List<Operation>> getUpcoming() async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('operations.getUpcoming failed: $e'));
    }
  }

  @override
  FutureResult<Operation> create(Operation operation) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('operations.create failed: $e'));
    }
  }

  @override
  FutureResult<void> update(Operation operation) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('operations.update failed: $e'));
    }
  }

  @override
  FutureResult<void> softDelete(int id) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('operations.softDelete failed: $e'));
    }
  }

  @override
  FutureResult<List<OperationRequiredTest>> getRequiredTests(
    int operationId,
  ) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('operations.getRequiredTests failed: $e'));
    }
  }

  @override
  FutureResult<void> addRequiredTest(OperationRequiredTest test) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('operations.addRequiredTest failed: $e'));
    }
  }

  @override
  FutureResult<void> updateRequiredTest(
    OperationRequiredTest test,
  ) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('operations.updateRequiredTest failed: $e'));
    }
  }

  @override
  FutureResult<void> deleteRequiredTest(int id) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('operations.deleteRequiredTest failed: $e'));
    }
  }
}
