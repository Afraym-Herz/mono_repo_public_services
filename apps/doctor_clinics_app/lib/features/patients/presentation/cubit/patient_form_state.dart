part of 'patient_form_cubit.dart';

@freezed
class PatientFormState with _$PatientFormState {
  const factory PatientFormState.initial() = _Initial;
  const factory PatientFormState.saving() = _Saving;
  const factory PatientFormState.saved({required Patient patient}) = _Saved;
  const factory PatientFormState.error({required String message}) = _Error;
}
