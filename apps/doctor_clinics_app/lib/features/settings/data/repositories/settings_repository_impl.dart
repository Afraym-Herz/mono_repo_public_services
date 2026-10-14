import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_settings.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_template.dart';
import 'package:doctor_clinics_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:doctor_clinics_app/features/settings/data/datasources/settings_datasource.dart';

class SettingsRepositoryImpl implements ISettingsRepository {
  final ISettingsDatasource datasource;

  SettingsRepositoryImpl({required this.datasource});

  @override
  Future<ClinicSettings> getSettings() {
    // TODO: implement.
    throw UnimplementedError();
  }

  @override
  Future<void> saveSettings(ClinicSettings settings) {
    // TODO: implement.
    throw UnimplementedError();
  }

  @override
  Future<ClinicTemplate> getClinicTemplate() {
    // TODO: implement.
    throw UnimplementedError();
  }

  @override
  Future<void> saveClinicTemplate(ClinicTemplate template) {
    // TODO: implement.
    throw UnimplementedError();
  }
}