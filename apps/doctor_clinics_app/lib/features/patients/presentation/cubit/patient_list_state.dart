part of 'patient_list_cubit.dart';

@freezed
class PatientListState with _$PatientListState {
  const factory PatientListState.initial() = _Initial;
  const factory PatientListState.loading() = _Loading;
  const factory PatientListState.loaded({required List<PatientListRow> rows}) =
      _Loaded;
  const factory PatientListState.error({required String message}) = _Error;
}
