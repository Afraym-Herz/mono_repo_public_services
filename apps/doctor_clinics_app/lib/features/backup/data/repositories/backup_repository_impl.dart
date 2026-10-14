import 'package:doctor_clinics_app/features/backup/domain/entities/backup_info.dart';
import 'package:doctor_clinics_app/features/backup/domain/repositories/backup_repository.dart';
import 'package:doctor_clinics_app/features/backup/data/datasources/backup_datasource.dart';

class BackupRepositoryImpl implements IBackupRepository {
  final IBackupDatasource datasource;

  BackupRepositoryImpl({required this.datasource});

  @override
  Future<BackupInfo> createBackup(String destinationPath) {
    throw UnimplementedError();
  }

  @override
  Future<void> restoreBackup(String backupFilePath) {
    throw UnimplementedError();
  }

  @override
  Future<List<BackupInfo>> listBackups(String directory) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOldBackups({int keepCount = 14}) {
    throw UnimplementedError();
  }

  @override
  Future<DateTime?> lastBackupDate() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isBackupStale({int thresholdDays = 1}) {
    throw UnimplementedError();
  }
}