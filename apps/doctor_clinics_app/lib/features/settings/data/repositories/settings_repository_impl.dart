import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_settings.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_template.dart';
import 'package:doctor_clinics_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:doctor_clinics_app/features/settings/data/datasources/settings_datasource.dart';

class SettingsRepositoryImpl implements ISettingsRepository {
  final ISettingsDatasource datasource;

  SettingsRepositoryImpl({required this.datasource});

  @override
  FutureResult<ClinicSettings> getSettings() async {
    try {
      // TODO: implement.
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('settings.getSettings failed: $e'));
    }
  }

  @override
  FutureResult<void> saveSettings(ClinicSettings settings) async {
    try {
      // TODO: implement.
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('settings.saveSettings failed: $e'));
    }
  }

  @override
  FutureResult<ClinicTemplate> getClinicTemplate() async {
    try {
      // TODO: implement.
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('settings.getClinicTemplate failed: $e'));
    }
  }

  @override
  FutureResult<void> saveClinicTemplate(ClinicTemplate template) async {
    try {
      // TODO: implement.
      throw UnimplementedError();
    } catch (e) {
      return Left(CacheFailure('settings.saveClinicTemplate failed: $e'));
    }
  }
}
