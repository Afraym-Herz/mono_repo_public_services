import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:doctor_clinics_app/features/backup/data/datasources/backup_datasource.dart';

/// File-based implementation of [IBackupDatasource] using filesystem operations.
class BackupLocalDatasource implements IBackupDatasource {
  BackupLocalDatasource();

  @override
  Future<String> exportDatabase(String destinationPath) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(appDocDir.path, 'doctor_clinics_app.sqlite'));
    final destDir = Directory(destinationPath);
    if (!await destDir.exists()) {
      await destDir.create(recursive: true);
    }
    final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
    final backupFileName = 'backup_$timestamp.sqlite';
    final backupFile = File(p.join(destinationPath, backupFileName));
    if (await dbFile.exists()) {
      await dbFile.copy(backupFile.path);
    } else {
      await backupFile.writeAsString('backup-placeholder-$timestamp');
    }
    return backupFile.path;
  }

  @override
  Future<void> importDatabase(String backupFilePath) async {
    final backupFile = File(backupFilePath);
    if (!await backupFile.exists()) {
      throw FileSystemException('Backup file not found', backupFilePath);
    }
    final appDocDir = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(appDocDir.path, 'doctor_clinics_app.sqlite'));
    await backupFile.copy(dbFile.path);
  }

  @override
  Future<List<String>> listBackupFiles(String directory) async {
    final dir = Directory(directory);
    if (!await dir.exists()) return [];
    final files = await dir
        .list()
        .where((entity) =>
            entity is File &&
            (entity.path.endsWith('.sqlite') || entity.path.endsWith('.zip')))
        .map((e) => e.path)
        .toList();
    return files;
  }

  @override
  Future<void> deleteFile(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  @override
  Future<int> fileSizeBytes(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      return file.length();
    }
    return 0;
  }
}
