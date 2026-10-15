import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/backup/domain/entities/backup_info.dart';
import 'package:doctor_clinics_app/features/backup/domain/repositories/backup_repository.dart';
import 'package:doctor_clinics_app/features/backup/data/datasources/backup_datasource.dart';

class BackupRepositoryImpl implements IBackupRepository {
  final IBackupDatasource datasource;

  BackupRepositoryImpl({required this.datasource});

  @override
  FutureResult<BackupInfo> createBackup(String destinationPath) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('backup.createBackup failed: $e'));
    }
  }

  @override
  FutureResult<void> restoreBackup(String backupFilePath) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('backup.restoreBackup failed: $e'));
    }
  }

  @override
  FutureResult<List<BackupInfo>> listBackups(String directory) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('backup.listBackups failed: $e'));
    }
  }

  @override
  FutureResult<void> deleteOldBackups({int keepCount = 14}) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('backup.deleteOldBackups failed: $e'));
    }
  }

  @override
  FutureResult<DateTime?> lastBackupDate() async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('backup.lastBackupDate failed: $e'));
    }
  }

  @override
  FutureResult<bool> isBackupStale({int thresholdDays = 1}) async {
    try {
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('backup.isBackupStale failed: $e'));
    }
  }
}
