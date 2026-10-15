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
      final settings = await datasource.fetchSettings();
      return Right(
        settings ??
            const ClinicSettings(
              clinicName: 'My Clinic',
              language: 'ar',
              paperSize: 'A4',
              receiptMargin: 10,
            ),
      );
    } catch (e) {
      return Left(CacheFailure('settings.getSettings failed: $e'));
    }
  }

  @override
  FutureResult<void> saveSettings(ClinicSettings settings) async {
    try {
      await datasource.upsertSettings(settings);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('settings.saveSettings failed: $e'));
    }
  }

  @override
  FutureResult<ClinicTemplate> getClinicTemplate() async {
    try {
      final template = await datasource.fetchClinicTemplate();
      final now = DateTime.now();
      return Right(
        template ??
            ClinicTemplate(
              id: 1,
              clinicNameAr: 'عيادتي',
              doctorNameAr: 'د. الطبيب',
              printLanguage: 'ar',
              paperSize: 'A4',
              createdAt: now,
              updatedAt: now,
            ),
      );
    } catch (e) {
      return Left(CacheFailure('settings.getClinicTemplate failed: $e'));
    }
  }

  @override
  FutureResult<void> saveClinicTemplate(ClinicTemplate template) async {
    try {
      await datasource.upsertClinicTemplate(template);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('settings.saveClinicTemplate failed: $e'));
    }
  }
}
