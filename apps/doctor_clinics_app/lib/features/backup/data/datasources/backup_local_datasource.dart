import 'package:doctor_clinics_app/features/backup/data/datasources/backup_datasource.dart';

/// File-based stub of [IBackupDatasource] (no DAO — file ops only).
class BackupLocalDatasource implements IBackupDatasource {
  BackupLocalDatasource();

  @override
  Future<String> exportDatabase(String destinationPath) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> importDatabase(String backupFilePath) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<List<String>> listBackupFiles(String directory) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFile(String filePath) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<int> fileSizeBytes(String filePath) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }
}
