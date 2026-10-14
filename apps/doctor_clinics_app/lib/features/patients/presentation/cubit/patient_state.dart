part of 'patient_cubit.dart';

@freezed
class PatientState with _$PatientState {
  const factory PatientState.initial() = _Initial;
  const factory PatientState.loading() = _Loading;
  const factory PatientState.loaded({
    required List<Patient> patients,
  }) = _Loaded;
  const factory PatientState.patientDetail({
    required Patient patient,
    required List<PatientAllergy> allergies,
    required List<PatientCondition> conditions,
  }) = _PatientDetail;
  const factory PatientState.error({
    required String message,
  }) = _Error;
}