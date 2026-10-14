import 'package:doctor_clinics_app/features/audit/domain/entities/audit_event.dart';

/// Local data-source for the audit trail (Drift).
abstract class IAuditDatasource {
  Future<void> insert(AuditEvent event);
  Future<List<AuditEvent>> fetchByEntity(
    String entityType,
    int entityId,
  );
  Future<List<AuditEvent>> fetchByUser(int userId);
  Future<List<AuditEvent>> fetchByDateRange(
    DateTime from,
    DateTime to,
  );
  Future<List<AuditEvent>> fetchRecent({int limit = 50});
}