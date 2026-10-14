import 'package:doctor_clinics_app/features/audit/domain/entities/audit_event.dart';
import 'package:doctor_clinics_app/features/audit/domain/repositories/audit_repository.dart';
import 'package:doctor_clinics_app/features/audit/data/datasources/audit_datasource.dart';

class AuditRepositoryImpl implements IAuditRepository {
  final IAuditDatasource datasource;

  AuditRepositoryImpl({required this.datasource});

  @override
  Future<void> log(AuditEvent event) {
    throw UnimplementedError();
  }

  @override
  Future<List<AuditEvent>> getByEntity(
    String entityType,
    int entityId,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<List<AuditEvent>> getByUser(int userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<AuditEvent>> getByDateRange(
    DateTime from,
    DateTime to,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<List<AuditEvent>> getRecent({int limit = 50}) {
    throw UnimplementedError();
  }
}