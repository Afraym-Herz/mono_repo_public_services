import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/core/finance/domain/finance_range.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/expenses_section.dart';

part 'expenses_toolbar_state.dart';
part 'expenses_toolbar_cubit.freezed.dart';

/// Owns the expenses screen controls: range pill, active section and the
/// debounced ledger/expense search query.
class ExpensesToolbarCubit extends Cubit<ExpensesToolbarState> {
  ExpensesToolbarCubit() : super(const ExpensesToolbarState());

  static const Duration _debounceDuration = Duration(milliseconds: 500);

  /// Search input controller owned here so the field stays stateless.
  final TextEditingController controller = TextEditingController();

  Timer? _debounce;

  /// Debounces keystrokes (500ms) and flips [ExpensesToolbarState.isSearching].
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

  /// Selects the date window used by the dashboard.
  void rangeChanged(FinanceRange range) {
    if (range == state.range) return;
    emit(state.copyWith(range: range));
  }

  /// Selects the visible section.
  void sectionChanged(ExpensesSection section) {
    if (section == state.section) return;
    emit(state.copyWith(section: section));
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
