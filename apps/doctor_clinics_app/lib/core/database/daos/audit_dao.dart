import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/audit_logs_table.dart';

part 'audit_dao.g.dart';

@DriftAccessor(tables: [AuditLogs])
class AuditDao extends DatabaseAccessor<AppDatabase> with _$AuditDaoMixin {
  AuditDao(super.db);

  Future<List<AuditLog>> getAuditLogs() => select(auditLogs).get();
  Future<int> insertLog(AuditLogsCompanion entry) => into(auditLogs).insert(entry);
}
