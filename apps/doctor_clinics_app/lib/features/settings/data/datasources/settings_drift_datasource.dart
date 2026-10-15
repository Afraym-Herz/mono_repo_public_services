import 'package:doctor_clinics_app/core/database/daos/settings_dao.dart';
import 'package:doctor_clinics_app/features/settings/data/datasources/settings_datasource.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_settings.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_template.dart';

/// Drift-backed stub of [ISettingsDatasource].
class SettingsDriftDatasource implements ISettingsDatasource {
  final SettingsDao dao;
  SettingsDriftDatasource(this.dao);

  @override
  Future<ClinicSettings?> fetchSettings() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> upsertSettings(ClinicSettings settings) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<ClinicTemplate?> fetchClinicTemplate() async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }

  @override
  Future<void> upsertClinicTemplate(ClinicTemplate template) async {
    // TODO: Drift mapping
    throw UnimplementedError();
  }
}
