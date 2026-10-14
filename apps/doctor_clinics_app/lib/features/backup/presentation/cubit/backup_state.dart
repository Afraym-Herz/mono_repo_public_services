part of 'backup_cubit.dart';

@freezed
class BackupState with _$BackupState {
  const factory BackupState.initial() = _Initial;
  const factory BackupState.loading() = _Loading;
  const factory BackupState.loaded({
    required List<BackupInfo> backups,
    required bool isStale,
  }) = _Loaded;
  const factory BackupState.success({
    required String message,
  }) = _Success;
  const factory BackupState.error({
    required String message,
  }) = _Error;
}