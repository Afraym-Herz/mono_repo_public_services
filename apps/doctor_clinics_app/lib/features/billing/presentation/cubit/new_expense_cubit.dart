import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_expense_category.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';

part 'new_expense_state.dart';
part 'new_expense_cubit.freezed.dart';

/// Loads expense buckets and persists one operating expense.
class NewExpenseCubit extends Cubit<NewExpenseState> {
  NewExpenseCubit({required this.repository})
    : super(const NewExpenseState());

  final IBillingRepository repository;

  Future<void> load() async {
    emit(state.copyWith(loading: true, error: null));
    final result = await repository.getExpenseCategories();
    if (isClosed) return;
    final failure = result.fold((error) => error.message, (_) => null);
    if (failure != null) {
      emit(state.copyWith(loading: false, error: failure));
      return;
    }
    emit(
      state.copyWith(
        loading: false,
        categories: result.getOrElse(
          () => const <BillingExpenseCategory>[],
        ),
      ),
    );
  }

  Future<BillingExpenseCategory?> createCategory(String name) async {
    final result = await repository.addExpenseCategory(name);
    if (isClosed) return null;
    final failure = result.fold((error) => error.message, (_) => null);
    if (failure != null) {
      emit(state.copyWith(error: failure));
      return null;
    }
    final category = result.getOrElse(
      () => BillingExpenseCategory(id: 0, name: name),
    );
    emit(state.copyWith(categories: [...state.categories, category]));
    return category;
  }

  Future<void> save({
    required int categoryId,
    required int amountPiasters,
    required DateTime date,
    required String description,
    String? notes,
  }) async {
    if (state.saving) return;
    emit(state.copyWith(saving: true, error: null));
    final result = await repository.addExpense(
      Expense(
        id: 0,
        category: categoryId.toString(),
        description: description,
        amountPiasters: amountPiasters,
        expenseDate: date,
        notes: notes,
        createdBy: 0,
        createdAt: date,
        updatedAt: DateTime.now(),
      ),
    );
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(saving: false, error: failure.message)),
      (expense) => emit(state.copyWith(saving: false, saved: expense)),
    );
  }

  void clearError() {
    if (state.error != null) emit(state.copyWith(error: null));
  }
}
