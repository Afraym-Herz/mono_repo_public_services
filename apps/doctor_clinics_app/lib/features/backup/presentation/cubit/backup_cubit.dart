import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/backup/domain/entities/backup_info.dart';
import 'package:doctor_clinics_app/features/backup/domain/repositories/backup_repository.dart';

part 'backup_state.dart';
part 'backup_cubit.freezed.dart';

class BackupCubit extends Cubit<BackupState> {
  final IBackupRepository repository;

  BackupCubit({required this.repository})
      : super(const BackupState.initial());

  Future<void> loadBackups(String directory) async {
    emit(const BackupState.loading());
    final listResult = await repository.listBackups(directory);
    final staleResult = await repository.isBackupStale();

    final isStale = staleResult.fold((_) => false, (s) => s);
    listResult.fold(
      (failure) => emit(BackupState.error(message: failure.message)),
      (backups) => emit(BackupState.loaded(backups: backups, isStale: isStale)),
    );
  }

  Future<void> createBackup(String destination) async {
    emit(const BackupState.loading());
    final result = await repository.createBackup(destination);
    result.fold(
      (failure) => emit(BackupState.error(message: failure.message)),
      (info) => emit(
        BackupState.success(message: 'Backup created at ${info.filePath}'),
      ),
    );
  }

  Future<void> restoreBackup(String filePath) async {
    emit(const BackupState.loading());
    final result = await repository.restoreBackup(filePath);
    result.fold(
      (failure) => emit(BackupState.error(message: failure.message)),
      (_) => const BackupState.success(
        message: 'Backup restored successfully',
      ),
    );
  }

  Future<void> cleanOldBackups() async {
    await repository.deleteOldBackups();
  }
}