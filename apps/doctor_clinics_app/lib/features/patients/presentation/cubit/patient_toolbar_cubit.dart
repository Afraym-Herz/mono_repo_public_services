import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/patients/presentation/helpers/patient_filter.dart';

part 'patient_toolbar_state.dart';
part 'patient_toolbar_pagination.dart';
part 'patient_toolbar_cubit.freezed.dart';

/// Owns the patients list's scoped state: the debounced search query, the
/// active filter chip, whether a search is in flight, the current page and the
/// floating suggestion dropdown anchored to the search pill.
///
/// The register is paged in memory, so any query/filter change goes back to
/// the first page.
class PatientToolbarCubit extends Cubit<PatientToolbarState>
    with PatientToolbarPagination {
  PatientToolbarCubit() : super(const PatientToolbarState());

  static const Duration _debounceDuration = Duration(milliseconds: 500);

  /// Search input controller owned here so the field stays stateless.
  final TextEditingController controller = TextEditingController();

  /// Shows/hides the dropdown built by the field's `OverlayPortal`, so no
  /// widget has to keep an overlay entry alive itself.
  final OverlayPortalController suggestions = OverlayPortalController();

  /// Anchor the dropdown follows; shared with the pill's transform target.
  final LayerLink suggestionsLink = LayerLink();

  Timer? _debounce;

  /// Debounces keystrokes (500ms) and flips [PatientToolbarState.isSearching].
  void queryChanged(String value) {
    _debounce?.cancel();
    final query = value.trim();
    if (query.isEmpty) {
      emit(state.copyWith(query: '', isSearching: false, page: 0));
      _hideSuggestions();
      return;
    }
    emit(state.copyWith(isSearching: true));
    _debounce = Timer(_debounceDuration, () => _apply(query));
  }

  /// Selects a filter chip and returns to the first page.
  void filterChanged(PatientFilter filter) {
    if (filter == state.filter) return;
    emit(state.copyWith(filter: filter, page: 0));
  }

  /// Re-opens the dropdown for the current query (e.g. after tapping away).
  void showSuggestions() {
    if (state.query.isEmpty) return;
    suggestions.show();
  }

  /// Hides the dropdown but keeps the query so the field can be reused.
  void dismissSuggestions() => _hideSuggestions();

  /// Clears the search input, its debounced query and the dropdown.
  void clearQuery() {
    _debounce?.cancel();
    controller.clear();
    emit(state.copyWith(query: '', isSearching: false, page: 0));
    _hideSuggestions();
  }

  void _apply(String query) {
    if (isClosed) return;
    emit(state.copyWith(query: query, isSearching: false, page: 0));
    suggestions.show();
  }

  void _hideSuggestions() {
    if (suggestions.isShowing) suggestions.hide();
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    controller.dispose();
    return super.close();
  }
}
