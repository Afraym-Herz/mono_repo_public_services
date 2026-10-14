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
    // TODO: implement.
  }

  Future<void> updateSettings(ClinicSettings settings) async {
    // TODO: implement.
  }

  Future<void> updateClinicTemplate(
    ClinicTemplate template,
  ) async {
    // TODO: implement.
  }
}