import 'package:core/core.dart';
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/operations_table.dart';

part 'operation_dao.g.dart';

@DriftAccessor(tables: [Operations, OperationRequiredTests])
class OperationDao extends DatabaseAccessor<AppDatabase>
    with _$OperationDaoMixin {
  OperationDao(super.db);

  // Soft-deleted rows (deletedAt set) are never returned.
  Future<List<Operation>> getAllOperations() =>
      (select(operations)..where((o) => o.deletedAt.isNull())).get();
  Future<List<Operation>> getOperationsForPatient(int patientId) => (select(
    operations,
  )..where((o) => o.patientId.equals(patientId) & o.deletedAt.isNull())).get();
  Future<List<Operation>> getUpcomingOperations() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return (select(operations)..where(
          (o) =>
              // Scheduled dates are day-only, so today must be included.
              o.scheduledDate.isBiggerOrEqualValue(today) &
              o.status.equals(AppConstants.operationStatusScheduled) &
              o.deletedAt.isNull(),
        ))
        .get();
  }

  Future<int> insertOperation(OperationsCompanion entry) =>
      into(operations).insert(entry);
  Future<bool> updateOperation(OperationsCompanion entry) =>
      update(operations).replace(entry);

  /// Updates the operation and syncs its checklist names in one transaction,
  /// so a saved edit can never leave the row and its tests disagreeing.
  Future<void> updateOperationWithTests(
    OperationsCompanion entry,
    int operationId,
    List<String> testNames,
  ) {
    return transaction(() async {
      await update(operations).replace(entry);
      final existing = await getTestsForOperation(operationId);
      final wanted = testNames.toSet();
      for (final test in existing) {
        if (!wanted.contains(test.testName)) await deleteTest(test.id);
      }
      final kept = existing.map((test) => test.testName).toSet();
      for (final name in testNames) {
        if (kept.contains(name)) continue;
        await into(operationRequiredTests).insert(
          OperationRequiredTestsCompanion.insert(
            operationId: operationId,
            testName: name,
          ),
        );
      }
    });
  }

  /// Marks the operation deleted without touching its tests or billing rows.
  Future<int> softDeleteOperation(int id) =>
      (update(operations)..where((o) => o.id.equals(id))).write(
        OperationsCompanion(
          deletedAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );

  /// Inserts an operation and its required-test checklist as one transaction.
  Future<int> insertOperationWithTests(
    OperationsCompanion entry,
    List<String> testNames,
  ) {
    return transaction(() async {
      final id = await into(operations).insert(entry);
      for (final name in testNames) {
        await into(operationRequiredTests).insert(
          OperationRequiredTestsCompanion.insert(
            operationId: id,
            testName: name,
          ),
        );
      }
      return id;
    });
  }

  Future<List<OperationRequiredTest>> getTestsForOperation(int operationId) =>
      (select(
        operationRequiredTests,
      )..where((t) => t.operationId.equals(operationId))).get();
  Future<int> insertTest(OperationRequiredTestsCompanion entry) =>
      into(operationRequiredTests).insert(entry);
  Future<bool> updateTest(OperationRequiredTestsCompanion entry) =>
      update(operationRequiredTests).replace(entry);
  Future<int> deleteTest(int id) =>
      (delete(operationRequiredTests)..where((t) => t.id.equals(id))).go();
}
