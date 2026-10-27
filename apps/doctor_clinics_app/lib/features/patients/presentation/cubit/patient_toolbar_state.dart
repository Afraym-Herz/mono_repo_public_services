part of 'patient_toolbar_cubit.dart';

@freezed
class PatientToolbarState with _$PatientToolbarState {
  const factory PatientToolbarState({
    @Default('') String query,
    @Default(PatientFilter.all) PatientFilter filter,
    @Default(false) bool isSearching,
    @Default(0) int page,
  }) = _PatientToolbarState;
}
