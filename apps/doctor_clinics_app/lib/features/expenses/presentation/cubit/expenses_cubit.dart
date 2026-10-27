import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/core/finance/domain/finance_range.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expenses_overview.dart';
import 'package:doctor_clinics_app/features/expenses/domain/repositories/expenses_repository.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/expenses_overview_builder.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/expenses_source.dart';

part 'expenses_state.dart';
part 'expenses_cubit.freezed.dart';

/// Loads the outflow read model and re-scopes it when the range changes.
///
/// The raw rows are cached in [ExpensesSource], so tapping another range pill
/// only rebuilds the overview instead of re-reading every table.
class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit({required this.repository})
    : super(const ExpensesState.initial());

  final IExpensesRepository repository;

  ExpensesSource? _source;
  FinanceRange _range = FinanceRange.month;
  int _request = 0;

  /// Rebuilds the overview for [range], fetching the snapshot when needed.
  Future<void> load({FinanceRange? range, bool force = false}) async {
    if (range != null) _range = range;
    final request = ++_request;

    if (_source == null || force) {
      emit(const ExpensesState.loading());
      _source = await ExpensesSourceLoader.load(repository: repository);
    }
    if (request != _request || isClosed) return;

    final source = _source;
    if (source == null) {
      emit(const ExpensesState.error(message: 'billing.error.load'));
      return;
    }

    emit(
      ExpensesState.loaded(
        overview: ExpensesOverviewBuilder.build(
          range: _range,
          expenses: source.expenses,
          categories: source.categories,
          purchases: source.purchases,
          purchaseItems: source.purchaseItems,
          purchasePayments: source.purchasePayments,
          vendors: source.vendors,
          now: DateTime.now(),
        ),
      ),
    );
  }

  /// Re-reads the local database, discarding the cached snapshot.
  Future<void> refresh() => load(force: true);
}
