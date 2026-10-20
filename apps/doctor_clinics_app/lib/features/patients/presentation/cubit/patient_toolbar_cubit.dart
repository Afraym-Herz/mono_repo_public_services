import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/patients/presentation/helpers/patient_filter.dart';

part 'patient_toolbar_state.dart';
part 'patient_toolbar_cubit.freezed.dart';

/// Owns the patients toolbar's scoped state: the debounced search query, the
/// active filter chip and whether a search is in flight.
///
/// The table is not wired yet, so this cubit only tracks the query/filter; it
/// holds the debounce so the list never filters on every keystroke.
class PatientToolbarCubit extends Cubit<PatientToolbarState> {
  PatientToolbarCubit() : super(const PatientToolbarState());

  static const Duration _debounceDuration = Duration(milliseconds: 500);

  /// Search input controller owned here so the field stays stateless.
  final TextEditingController controller = TextEditingController();

  Timer? _debounce;

  /// Debounces keystrokes (500ms) and flips [PatientToolbarState.isSearching].
  void queryChanged(String value) {
    _debounce?.cancel();
    final query = value.trim();
    if (query.isEmpty) {
      emit(state.copyWith(query: '', isSearching: false));
      return;
    }
    emit(state.copyWith(isSearching: true));
    _debounce = Timer(_debounceDuration, () => _apply(query));
  }

  /// Selects a filter chip.
  void filterChanged(PatientFilter filter) {
    if (filter == state.filter) return;
    emit(state.copyWith(filter: filter));
  }

  /// Clears the search input and its debounced query.
  void clearQuery() {
    _debounce?.cancel();
    controller.clear();
    emit(state.copyWith(query: '', isSearching: false));
  }

  void _apply(String query) {
    if (isClosed) return;
    emit(state.copyWith(query: query, isSearching: false));
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    controller.dispose();
    return super.close();
  }
}
