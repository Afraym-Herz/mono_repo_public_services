part of 'expense_form_cubit.dart';

@freezed
class ExpenseFormState with _$ExpenseFormState {
  const factory ExpenseFormState({
    @Default(true) bool loading,
    @Default(false) bool saving,
    @Default(false) bool saved,
    Expense? expense,
    @Default(<ExpenseCategoryEntity>[])
    List<ExpenseCategoryEntity> categories,
    String? error,
  }) = _ExpenseFormState;
}
