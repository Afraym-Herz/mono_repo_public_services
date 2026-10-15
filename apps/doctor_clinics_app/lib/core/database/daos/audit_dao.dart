import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/audit_logs_table.dart';

part 'audit_dao.g.dart';

@DriftAccessor(tables: [AuditLogs])
class AuditDao extends DatabaseAccessor<AppDatabase> with _$AuditDaoMixin {
  AuditDao(super.db);

  Future<List<AuditLog>> getAuditLogs() => select(auditLogs).get();
  Future<int> insertLog(AuditLogsCompanion entry) => into(auditLogs).insert(entry);

  Future<List<AuditLog>> getLogsByEntity(String entityType, int entityId) =>
      (select(auditLogs)
            ..where((a) =>
                a.entityType.equals(entityType) & a.entityId.equals(entityId)))
          .get();

  Future<List<AuditLog>> getLogsByUser(int userId) =>
      (select(auditLogs)..where((a) => a.userId.equals(userId))).get();

  Future<List<AuditLog>> getLogsByDateRange(DateTime from, DateTime to) =>
      (select(auditLogs)
            ..where((a) =>
                a.timestamp.isBiggerOrEqualValue(from) &
                a.timestamp.isSmallerThanValue(to)))
          .get();

  Future<List<AuditLog>> getRecentLogs({int limit = 50}) =>
      (select(auditLogs)
            ..orderBy([(a) => OrderingTerm.desc(a.timestamp)])
            ..limit(limit))
          .get();
}
