import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/audit/domain/entities/audit_event.dart';
import 'package:doctor_clinics_app/features/audit/domain/repositories/audit_repository.dart';
import 'package:doctor_clinics_app/features/audit/data/datasources/audit_datasource.dart';

class AuditRepositoryImpl implements IAuditRepository {
  final IAuditDatasource datasource;

  AuditRepositoryImpl({required this.datasource});

  @override
  FutureResult<void> log(AuditEvent event) async {
    try {
      await datasource.insert(event);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('audit.log failed: $e'));
    }
  }

  @override
  FutureResult<List<AuditEvent>> getByEntity(
    String entityType,
    int entityId,
  ) async {
    try {
      final list = await datasource.fetchByEntity(entityType, entityId);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('audit.getByEntity failed: $e'));
    }
  }

  @override
  FutureResult<List<AuditEvent>> getByUser(int userId) async {
    try {
      final list = await datasource.fetchByUser(userId);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('audit.getByUser failed: $e'));
    }
  }

  @override
  FutureResult<List<AuditEvent>> getByDateRange(
    DateTime from,
    DateTime to,
  ) async {
    try {
      final list = await datasource.fetchByDateRange(from, to);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('audit.getByDateRange failed: $e'));
    }
  }

  @override
  FutureResult<List<AuditEvent>> getRecent({int limit = 50}) async {
    try {
      final list = await datasource.fetchRecent(limit: limit);
      return Right(list);
    } catch (e) {
      return Left(CacheFailure('audit.getRecent failed: $e'));
    }
  }
}
