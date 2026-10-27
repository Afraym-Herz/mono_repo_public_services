part of 'expenses_toolbar_cubit.dart';

@freezed
class ExpensesToolbarState with _$ExpensesToolbarState {
  const factory ExpensesToolbarState({
    @Default(FinanceRange.month) FinanceRange range,
    @Default(ExpensesSection.expenses) ExpensesSection section,
    @Default('') String query,
    @Default(false) bool isSearching,
  }) = _ExpensesToolbarState;
}
