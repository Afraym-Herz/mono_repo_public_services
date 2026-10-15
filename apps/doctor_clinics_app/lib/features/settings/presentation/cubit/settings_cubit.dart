import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_settings.dart';
import 'package:doctor_clinics_app/features/settings/domain/entities/clinic_template.dart';
import 'package:doctor_clinics_app/features/settings/domain/repositories/settings_repository.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final ISettingsRepository repository;

  SettingsCubit({required this.repository})
      : super(const SettingsState.initial());

  Future<void> loadSettings() async {
    emit(const SettingsState.loading());
    final settingsResult = await repository.getSettings();
    final templateResult = await repository.getClinicTemplate();

    if (settingsResult.isLeft()) {
      emit(
        SettingsState.error(
          message: settingsResult.fold((f) => f.message, (_) => ''),
        ),
      );
      return;
    }

    final now = DateTime.now();
    final settings = settingsResult.fold(
      (_) => const ClinicSettings(
        clinicName: 'My Clinic',
        language: 'ar',
        paperSize: 'A4',
        receiptMargin: 10,
      ),
      (s) => s,
    );
    final template = templateResult.fold(
      (_) => ClinicTemplate(
        id: 1,
        clinicNameAr: 'عيادتي',
        doctorNameAr: 'د. الطبيب',
        printLanguage: 'ar',
        paperSize: 'A4',
        createdAt: now,
        updatedAt: now,
      ),
      (t) => t,
    );

    emit(SettingsState.loaded(settings: settings, template: template));
  }

  Future<void> updateSettings(ClinicSettings settings) async {
    emit(const SettingsState.loading());
    final result = await repository.saveSettings(settings);
    result.fold(
      (failure) => emit(SettingsState.error(message: failure.message)),
      (_) => loadSettings(),
    );
  }

  Future<void> updateClinicTemplate(ClinicTemplate template) async {
    emit(const SettingsState.loading());
    final result = await repository.saveClinicTemplate(template);
    result.fold(
      (failure) => emit(SettingsState.error(message: failure.message)),
      (_) => loadSettings(),
    );
  }
}