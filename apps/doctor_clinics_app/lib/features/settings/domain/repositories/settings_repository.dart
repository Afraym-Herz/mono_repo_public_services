import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_settings.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_template.dart';

/// Contract for clinic settings and template operations.
abstract class ISettingsRepository {
  FutureResult<ClinicSettings> getSettings();
  FutureResult<void> saveSettings(ClinicSettings settings);
  FutureResult<ClinicTemplate> getClinicTemplate();
  FutureResult<void> saveClinicTemplate(ClinicTemplate template);
}
