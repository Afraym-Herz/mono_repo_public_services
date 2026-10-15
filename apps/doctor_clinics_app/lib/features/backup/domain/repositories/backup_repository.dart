import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/backup/domain/entities/backup_info.dart';

/// Contract for backup and restore operations.
abstract class IBackupRepository {
  FutureResult<BackupInfo> createBackup(String destinationPath);
  FutureResult<void> restoreBackup(String backupFilePath);
  FutureResult<List<BackupInfo>> listBackups(String directory);
  FutureResult<void> deleteOldBackups({int keepCount = 14});
  FutureResult<DateTime?> lastBackupDate();
  FutureResult<bool> isBackupStale({int thresholdDays = 1});
}
