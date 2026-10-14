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
    // TODO: implement.
  }

  Future<void> createBackup(String destination) async {
    // TODO: implement.
  }

  Future<void> restoreBackup(String filePath) async {
    // TODO: implement.
  }

  Future<void> cleanOldBackups() async {
    // TODO: implement.
  }
}