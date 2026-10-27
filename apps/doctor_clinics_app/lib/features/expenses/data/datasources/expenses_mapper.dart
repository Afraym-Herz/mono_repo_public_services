import 'package:drift/drift.dart';
import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart'
    as entity;
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart'
    as entity;

/// Pure Drift row ↔ entity/companion mapping for expenses and categories.
class ExpensesMapper {
  const ExpensesMapper._();

  /// Maps an [Expense] row to its domain entity.
  static entity.Expense toDomainExpense(Expense row) {
    return entity.Expense(
      id: row.id,
      category: row.categoryId.toString(),
      description: row.description ?? '',
      amountPiasters: row.amount,
      expenseDate: row.expenseDate,
      notes: row.notes,
      createdBy: int.tryParse(row.createdBy) ?? 0,
      createdAt: row.expenseDate,
      updatedAt: row.expenseDate,
    );
  }

  /// Maps an [entity.Expense] to an [ExpensesCompanion].
  static ExpensesCompanion toExpenseCompanion(entity.Expense expense) {
    return ExpensesCompanion(
      id: expense.id > 0 ? Value(expense.id) : const Value.absent(),
      categoryId: Value(int.tryParse(expense.category) ?? 1),
      amount: Value(expense.amountPiasters),
      description: Value(expense.description),
      notes: Value(expense.notes),
      expenseDate: Value(expense.expenseDate),
      createdBy: Value(expense.createdBy.toString()),
    );
  }

  /// Maps an [ExpenseCategory] row to the domain lookup entity.
  static entity.ExpenseCategoryEntity toDomainCategory(ExpenseCategory row) {
    return entity.ExpenseCategoryEntity(id: row.id, name: row.name);
  }
}
