part of 'patient_edit_cubit.dart';

@freezed
class PatientEditState with _$PatientEditState {
  const factory PatientEditState.initial() = _Initial;
  const factory PatientEditState.saving() = _Saving;
  const factory PatientEditState.saved({required Patient patient}) = _Saved;
  const factory PatientEditState.error({required String message}) = _Error;
}
