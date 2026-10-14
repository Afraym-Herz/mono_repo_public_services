import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_info.freezed.dart';
part 'backup_info.g.dart';

@freezed
class BackupInfo with _$BackupInfo {
  const factory BackupInfo({
    required String filePath,
    required DateTime createdAt,
    required int sizeBytes,
    required String schemaVersion,
  }) = _BackupInfo;

  factory BackupInfo.fromJson(Map<String, dynamic> json) =>
      _$BackupInfoFromJson(json);
}