import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_settings.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_template.dart';

/// Contract for clinic settings and template operations.
abstract class ISettingsRepository {
  Future<ClinicSettings> getSettings();
  Future<void> saveSettings(ClinicSettings settings);
  Future<ClinicTemplate> getClinicTemplate();
  Future<void> saveClinicTemplate(ClinicTemplate template);
}