import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/core/finance/domain/finance_range.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_tab.dart';

part 'billing_toolbar_state.dart';
part 'billing_toolbar_cubit.freezed.dart';

/// Owns the accounts screen controls: range pill, active tab and the debounced
/// ledger search query.
class BillingToolbarCubit extends Cubit<BillingToolbarState> {
  BillingToolbarCubit() : super(const BillingToolbarState());

  static const Duration _debounceDuration = Duration(milliseconds: 500);

  /// Search input controller owned here so the field stays stateless.
  final TextEditingController controller = TextEditingController();

  Timer? _debounce;

  /// Debounces keystrokes (500ms) and flips [BillingToolbarState.isSearching].
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
  void tabChanged(BillingTab tab) {
    if (tab == state.tab) return;
    emit(state.copyWith(tab: tab));
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
