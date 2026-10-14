import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_settings.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_template.dart';

/// Local data-source for settings (backed by Drift / SharedPrefs).
abstract class ISettingsDatasource {
  Future<ClinicSettings?> fetchSettings();
  Future<void> upsertSettings(ClinicSettings settings);
  Future<ClinicTemplate?> fetchClinicTemplate();
  Future<void> upsertClinicTemplate(ClinicTemplate template);
}