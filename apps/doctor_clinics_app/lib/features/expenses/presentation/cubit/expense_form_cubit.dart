import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/domain/repositories/expenses_repository.dart';

part 'expense_form_state.dart';
part 'expense_form_cubit.freezed.dart';

/// Loads one expense with its category lookup and updates it.
class ExpenseFormCubit extends Cubit<ExpenseFormState> {
  ExpenseFormCubit({required this.repository})
    : super(const ExpenseFormState());

  final IExpensesRepository repository;

  Future<void> load(int expenseId) async {
    emit(state.copyWith(loading: true, error: null));
    final expenseResult = await repository.getExpense(expenseId);
    final categoriesResult = await repository.getExpenseCategories();
    if (isClosed) return;
    final expense = expenseResult.getOrElse(() => null);
    emit(
      state.copyWith(
        loading: false,
        expense: expense,
        categories: categoriesResult.getOrElse(() => const []),
        error: expense == null ? 'billing.expense_form.not_found' : null,
      ),
    );
  }

  Future<void> save({
    required int categoryId,
    required int amountPiasters,
    required DateTime date,
    required String description,
    String? notes,
  }) async {
    final expense = state.expense;
    if (expense == null || state.saving) return;
    emit(state.copyWith(saving: true, error: null));

    final result = await repository.updateExpense(
      expense.copyWith(
        category: categoryId.toString(),
        amountPiasters: amountPiasters,
        expenseDate: date,
        description: description,
        notes: notes,
        updatedAt: DateTime.now(),
      ),
    );
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(saving: false, error: failure.message)),
      (_) => emit(state.copyWith(saving: false, saved: true)),
    );
  }

  void clearError() {
    if (state.error != null) emit(state.copyWith(error: null));
  }
}
