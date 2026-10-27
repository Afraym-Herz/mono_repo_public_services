import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';

/// Case-insensitive search for the expense log.
class ExpenseFilter {
  ExpenseFilter._();

  static List<Expense> expenses(
    List<Expense> expenses,
    String query,
    String Function(Expense expense) categoryName,
  ) {
    final needle = query.trim().toLowerCase();
    if (needle.isEmpty) return expenses;
    return expenses.where((expense) {
      return expense.description.toLowerCase().contains(needle) ||
          (expense.notes ?? '').toLowerCase().contains(needle) ||
          categoryName(expense).toLowerCase().contains(needle);
    }).toList();
  }
}
