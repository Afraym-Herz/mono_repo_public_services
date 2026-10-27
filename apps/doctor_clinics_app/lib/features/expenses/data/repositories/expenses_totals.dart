import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_datasource.dart';

/// Sums `amountPiasters` for every expense inside [date]'s day window.
Future<int> sumExpensesForDay(
  IExpensesDatasource datasource,
  DateTime date,
) async {
  final start = DateTime(date.year, date.month, date.day);
  final end = start.add(const Duration(days: 1));
  final expenses = await datasource.fetchExpenses(from: start, to: end);
  var total = 0;
  for (final expense in expenses) {
    total += expense.amountPiasters;
  }
  return total;
}
