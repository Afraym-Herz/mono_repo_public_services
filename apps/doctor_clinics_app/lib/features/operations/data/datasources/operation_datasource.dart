import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';

/// Local data-source for operations (Drift).
abstract class IOperationDatasource {
  Future<List<Operation>> fetchAll();
  Future<List<Operation>> fetchByPatient(int patientId);
  Future<List<Operation>> fetchUpcoming();
  Future<int> insert(Operation operation);
  Future<int> insertWithTests(Operation operation, List<String> testNames);
  Future<void> update(Operation operation);
  Future<void> softDelete(int id);

  Future<List<OperationRequiredTest>> fetchRequiredTests(int operationId);
  Future<void> insertRequiredTest(OperationRequiredTest test);
  Future<void> updateRequiredTest(OperationRequiredTest test);
  Future<void> deleteRequiredTest(int id);
}
