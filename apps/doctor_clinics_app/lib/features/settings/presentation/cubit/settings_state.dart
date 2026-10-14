part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded({
    required ClinicSettings settings,
    required ClinicTemplate template,
  }) = _Loaded;
  const factory SettingsState.error({
    required String message,
  }) = _Error;
}