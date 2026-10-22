import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/helpers/patient_name_match.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

part 'patient_name_matches_state.dart';
part 'patient_name_matches_cubit.freezed.dart';

/// Watches the new-patient name field and lists patients already on file.
///
/// The register is loaded once and matched in memory, part by part (see
/// [PatientNameMatch]); queries shorter than [PatientNameMatch.minQueryLength]
/// stay empty. 500ms debounce, like every search in the app.
class PatientNameMatchesCubit extends Cubit<PatientNameMatchesState> {
  PatientNameMatchesCubit({required this.repository})
    : super(const PatientNameMatchesState.initial());

  static const Duration _debounceDuration = Duration(milliseconds: 500);

  final PatientRepository repository;
  Timer? _debounce;
  List<Patient>? _register;

  /// Debounces the typed name and refreshes the duplicate list.
  void queryChanged(String value) {
    _debounce?.cancel();
    if (value.trim().length < PatientNameMatch.minQueryLength) {
      emit(const PatientNameMatchesState.initial());
      return;
    }
    emit(
      PatientNameMatchesState.loading(
        query: state.visibleQuery,
        matches: state.visibleMatches,
      ),
    );
    _debounce = Timer(_debounceDuration, () => _find(value));
  }

  /// Immediate duplicate lookup used by the save guard (no debounce).
  Future<List<Patient>> duplicates(String name) async {
    final register = await _loadRegister();
    return _matchesFor(name, register);
  }

  Future<void> _find(String query) async {
    final register = await _loadRegister();
    if (isClosed) return;
    emit(
      PatientNameMatchesState.success(
        query: query.trim(),
        matches: _matchesFor(query, register),
      ),
    );
  }

  /// Best matches first (exact > likely > contact), ties by file number.
  List<Patient> _matchesFor(String query, List<Patient> register) {
    final matches = [
      for (final patient in register)
        if (PatientNameMatch.rank(query, patient) != PatientNameRank.none)
          patient,
    ];
    matches.sort((a, b) {
      final rank =
          PatientNameMatch.rank(query, b).index -
          PatientNameMatch.rank(query, a).index;
      return rank != 0 ? rank : a.fileNumber.compareTo(b.fileNumber);
    });
    return matches;
  }

  Future<List<Patient>> _loadRegister() async {
    final cached = _register;
    if (cached != null) return cached;
    final result = await repository.getAllPatients();
    return result.fold((_) => const <Patient>[], (patients) {
      _register = patients;
      return patients;
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
