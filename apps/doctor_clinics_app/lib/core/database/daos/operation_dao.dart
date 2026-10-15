import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/operations_table.dart';

part 'operation_dao.g.dart';

@DriftAccessor(tables: [Operations, OperationRequiredTests])
class OperationDao extends DatabaseAccessor<AppDatabase> with _$OperationDaoMixin {
  OperationDao(super.db);

  Future<List<Operation>> getAllOperations() => select(operations).get();
  Future<List<Operation>> getOperationsForPatient(int patientId) =>
      (select(operations)..where((o) => o.patientId.equals(patientId))).get();
  Future<List<Operation>> getUpcomingOperations() => (select(operations)
        ..where((o) =>
            o.scheduledDate.isBiggerOrEqualValue(DateTime.now()) &
            o.status.equals('scheduled')))
      .get();
  Future<int> insertOperation(OperationsCompanion entry) => into(operations).insert(entry);
  Future<bool> updateOperation(OperationsCompanion entry) => update(operations).replace(entry);
  Future<int> deleteOperation(int id) =>
      (delete(operations)..where((o) => o.id.equals(id))).go();

  Future<List<OperationRequiredTest>> getTestsForOperation(int operationId) =>
      (select(operationRequiredTests)..where((t) => t.operationId.equals(operationId))).get();
  Future<int> insertTest(OperationRequiredTestsCompanion entry) => into(operationRequiredTests).insert(entry);
  Future<bool> updateTest(OperationRequiredTestsCompanion entry) => update(operationRequiredTests).replace(entry);
  Future<int> deleteTest(int id) =>
      (delete(operationRequiredTests)..where((t) => t.id.equals(id))).go();
}
