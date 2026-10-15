import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/audit_dao.dart';
import 'package:doctor_clinics_app/features/audit/data/datasources/audit_datasource.dart';
import 'package:doctor_clinics_app/features/audit/domain/entities/audit_event.dart'
    as entity;

/// Concrete Drift implementation of [IAuditDatasource].
class AuditDriftDatasource implements IAuditDatasource {
  final AuditDao dao;

  AuditDriftDatasource(this.dao);

  @override
  Future<void> insert(entity.AuditEvent event) async {
    await dao.insertLog(
      AuditLogsCompanion(
        id: event.id > 0 ? Value(event.id) : const Value.absent(),
        userId: Value(event.userId),
        action: Value(event.action),
        entityType: Value(event.entityType),
        entityId: Value(event.entityId),
        timestamp: Value(event.createdAt),
        details: Value(event.newValue ?? event.oldValue),
      ),
    );
  }

  @override
  Future<List<entity.AuditEvent>> fetchByEntity(
    String entityType,
    int entityId,
  ) async {
    final rows = await dao.getLogsByEntity(entityType, entityId);
    return rows.map(_toDomainEvent).toList();
  }

  @override
  Future<List<entity.AuditEvent>> fetchByUser(int userId) async {
    final rows = await dao.getLogsByUser(userId);
    return rows.map(_toDomainEvent).toList();
  }

  @override
  Future<List<entity.AuditEvent>> fetchByDateRange(
    DateTime from,
    DateTime to,
  ) async {
    final rows = await dao.getLogsByDateRange(from, to);
    return rows.map(_toDomainEvent).toList();
  }

  @override
  Future<List<entity.AuditEvent>> fetchRecent({int limit = 50}) async {
    final rows = await dao.getRecentLogs(limit: limit);
    return rows.map(_toDomainEvent).toList();
  }

  entity.AuditEvent _toDomainEvent(AuditLog row) {
    return entity.AuditEvent(
      id: row.id,
      action: row.action,
      entityType: row.entityType,
      entityId: row.entityId ?? 0,
      userId: row.userId,
      oldValue: null,
      newValue: row.details,
      createdAt: row.timestamp,
    );
  }
}
