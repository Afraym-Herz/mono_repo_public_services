import 'package:doctor_clinics_app/features/audit/domain/entities/audit_event.dart';

/// Contract for audit-trail logging and retrieval.
abstract class IAuditRepository {
  Future<void> log(AuditEvent event);
  Future<List<AuditEvent>> getByEntity(
    String entityType,
    int entityId,
  );
  Future<List<AuditEvent>> getByUser(int userId);
  Future<List<AuditEvent>> getByDateRange(
    DateTime from,
    DateTime to,
  );
  Future<List<AuditEvent>> getRecent({int limit = 50});
}