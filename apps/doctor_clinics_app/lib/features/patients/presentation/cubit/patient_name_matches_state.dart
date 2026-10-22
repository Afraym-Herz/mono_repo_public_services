part of 'patient_name_matches_cubit.dart';

/// Where the new-patient duplicate check stands.
@freezed
class PatientNameMatchesState with _$PatientNameMatchesState {
  /// Nothing searchable typed yet — no dropdown.
  const factory PatientNameMatchesState.initial() = _Initial;

  /// Debounce running; the previous matches stay on screen meanwhile.
  const factory PatientNameMatchesState.loading({
    @Default('') String query,
    @Default(<Patient>[]) List<Patient> matches,
  }) = _Loading;

  /// Matches for [query], best (exact) first.
  const factory PatientNameMatchesState.success({
    required String query,
    required List<Patient> matches,
  }) = _Success;
}

/// What the dropdown should show right now: the latest finished search, kept
/// visible while the next one is being debounced.
extension PatientNameMatchesView on PatientNameMatchesState {
  String get visibleQuery => maybeMap(
    success: (success) => success.query,
    loading: (loading) => loading.query,
    orElse: () => '',
  );

  List<Patient> get visibleMatches => maybeMap(
    success: (success) => success.matches,
    loading: (loading) => loading.matches,
    orElse: () => const <Patient>[],
  );
}
