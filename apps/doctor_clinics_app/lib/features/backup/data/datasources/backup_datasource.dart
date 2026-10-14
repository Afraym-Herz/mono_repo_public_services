/// Local operations for backup/restore (zip, file copy).
abstract class IBackupDatasource {
  Future<String> exportDatabase(String destinationPath);
  Future<void> importDatabase(String backupFilePath);
  Future<List<String>> listBackupFiles(String directory);
  Future<void> deleteFile(String filePath);
  Future<int> fileSizeBytes(String filePath);
}