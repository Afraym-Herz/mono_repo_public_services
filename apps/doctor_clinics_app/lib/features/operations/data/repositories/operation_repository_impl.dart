import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/operations/data/datasources/operation_datasource.dart';
import 'package:doctor_clinics_app/features/operations/data/repositories/operation_repository_guard.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/domain/repositories/operation_repository.dart';

class OperationRepositoryImpl implements IOperationRepository {
  final IOperationDatasource datasource;

  OperationRepositoryImpl({required this.datasource});

  @override
  FutureResult<List<Operation>> getAll() =>
      guardOperationValue('getAll', datasource.fetchAll);

  @override
  FutureResult<List<Operation>> getByPatient(int patientId) =>
      guardOperationValue(
        'getByPatient',
        () => datasource.fetchByPatient(patientId),
      );

  @override
  FutureResult<List<Operation>> getUpcoming() =>
      guardOperationValue('getUpcoming', datasource.fetchUpcoming);

  @override
  FutureResult<Operation> create(Operation operation) => guardOperationValue(
    'create',
    () async => operation.copyWith(id: await datasource.insert(operation)),
  );

  @override
  FutureResult<Operation> createWithTests(
    Operation operation,
    List<String> testNames,
  ) => guardOperationValue(
    'createWithTests',
    () async => operation.copyWith(
      id: await datasource.insertWithTests(operation, testNames),
    ),
  );

  @override
  FutureResult<void> update(Operation operation) =>
      guardOperationVoid('update', () => datasource.update(operation));

  @override
  FutureResult<void> updateWithTests(
    Operation operation,
    List<String> testNames,
  ) => guardOperationVoid(
    'updateWithTests',
    () => datasource.updateWithTests(operation, testNames),
  );

  @override
  FutureResult<void> softDelete(int id) =>
      guardOperationVoid('softDelete', () => datasource.softDelete(id));

  @override
  FutureResult<List<OperationRequiredTest>> getRequiredTests(int operationId) =>
      guardOperationValue(
        'getRequiredTests',
        () => datasource.fetchRequiredTests(operationId),
      );

  @override
  FutureResult<void> addRequiredTest(OperationRequiredTest test) =>
      guardOperationVoid(
        'addRequiredTest',
        () => datasource.insertRequiredTest(test),
      );

  @override
  FutureResult<void> updateRequiredTest(OperationRequiredTest test) =>
      guardOperationVoid(
        'updateRequiredTest',
        () => datasource.updateRequiredTest(test),
      );

  @override
  FutureResult<void> deleteRequiredTest(int id) => guardOperationVoid(
    'deleteRequiredTest',
    () => datasource.deleteRequiredTest(id),
  );
}
