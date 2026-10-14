import 'package:doctor_clinics_app/features/backup/domain/entities/backup_info.dart';

/// Contract for backup and restore operations.
abstract class IBackupRepository {
  Future<BackupInfo> createBackup(String destinationPath);
  Future<void> restoreBackup(String backupFilePath);
  Future<List<BackupInfo>> listBackups(String directory);
  Future<void> deleteOldBackups({int keepCount = 14});
  Future<DateTime?> lastBackupDate();
  Future<bool> isBackupStale({int thresholdDays = 1});
}