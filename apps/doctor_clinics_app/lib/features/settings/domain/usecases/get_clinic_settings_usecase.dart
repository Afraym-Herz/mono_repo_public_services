import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_settings.dart';
import 'package:doctor_clinics_app/features/settings/domain/repositories/settings_repository.dart';

class GetClinicSettingsUsecase extends UseCase<ClinicSettings, NoParams> {
  final ISettingsRepository repository;

  GetClinicSettingsUsecase(this.repository);

  @override
  FutureResult<ClinicSettings> call(NoParams params) =>
      repository.getSettings();
}
