import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/operations_table.dart';

part 'operation_dao.g.dart';

@DriftAccessor(tables: [Operations, OperationRequiredTests])
class OperationDao extends DatabaseAccessor<AppDatabase> with _$OperationDaoMixin {
  OperationDao(super.db);

  Future<List<Operation>> getOperationsForPatient(int patientId) =>
      (select(operations)..where((o) => o.patientId.equals(patientId))).get();
  Future<int> insertOperation(OperationsCompanion entry) => into(operations).insert(entry);
  Future<bool> updateOperation(OperationsCompanion entry) => update(operations).replace(entry);

  Future<List<OperationRequiredTest>> getTestsForOperation(int operationId) =>
      (select(operationRequiredTests)..where((t) => t.operationId.equals(operationId))).get();
  Future<int> insertTest(OperationRequiredTestsCompanion entry) => into(operationRequiredTests).insert(entry);
}
