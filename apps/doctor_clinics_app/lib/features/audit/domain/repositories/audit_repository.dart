import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/audit/domain/entities/audit_event.dart';

/// Contract for audit-trail logging and retrieval.
abstract class IAuditRepository {
  FutureResult<void> log(AuditEvent event);
  FutureResult<List<AuditEvent>> getByEntity(
    String entityType,
    int entityId,
  );
  FutureResult<List<AuditEvent>> getByUser(int userId);
  FutureResult<List<AuditEvent>> getByDateRange(
    DateTime from,
    DateTime to,
  );
  FutureResult<List<AuditEvent>> getRecent({int limit = 50});
}
