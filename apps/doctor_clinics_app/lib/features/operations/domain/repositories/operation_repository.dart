import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation.dart';
import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';

/// Contract for operation scheduling and management.
abstract class IOperationRepository {
  FutureResult<List<Operation>> getAll();
  FutureResult<List<Operation>> getByPatient(int patientId);
  FutureResult<List<Operation>> getUpcoming();
  FutureResult<Operation> create(Operation operation);
  FutureResult<Operation> createWithTests(
    Operation operation,
    List<String> testNames,
  );
  FutureResult<void> update(Operation operation);
  FutureResult<void> softDelete(int id);

  //   Required tests
  FutureResult<List<OperationRequiredTest>> getRequiredTests(int operationId);
  FutureResult<void> addRequiredTest(OperationRequiredTest test);
  FutureResult<void> updateRequiredTest(OperationRequiredTest test);
  FutureResult<void> deleteRequiredTest(int id);
}
