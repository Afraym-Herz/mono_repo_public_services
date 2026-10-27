part of 'new_expense_cubit.dart';

@freezed
class NewExpenseState with _$NewExpenseState {
  const factory NewExpenseState({
    @Default(true) bool loading,
    @Default(false) bool saving,
    @Default(<ExpenseCategoryEntity>[])
    List<ExpenseCategoryEntity> categories,
    Expense? saved,
    String? error,
  }) = _NewExpenseState;
}
