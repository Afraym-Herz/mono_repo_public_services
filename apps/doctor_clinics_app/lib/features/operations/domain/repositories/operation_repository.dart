import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';

/// Contract for operation scheduling and management.
abstract class IOperationRepository {
  Future<List<Operation>> getAll();
  Future<List<Operation>> getByPatient(int patientId);
  Future<List<Operation>> getUpcoming();
  Future<Operation> create(Operation operation);
  Future<void> update(Operation operation);
  Future<void> softDelete(int id);

  //   Required tests
  Future<List<OperationRequiredTest>> getRequiredTests(int operationId);
  Future<void> addRequiredTest(OperationRequiredTest test);
  Future<void> updateRequiredTest(OperationRequiredTest test);
  Future<void> deleteRequiredTest(int id);
}
