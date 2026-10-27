import 'package:doctor_clinics_app/core/finance/domain/finance_range.dart';
import 'package:doctor_clinics_app/core/finance/domain/ledger_row.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/spend_totals.dart';

/// Outflow read model consumed by the expenses dashboard.
class ExpensesOverview {
  const ExpensesOverview({
    required this.range,
    required this.totals,
    required this.purchaseRows,
    required this.expenses,
    required this.expenseCategories,
  });

  final FinanceRange range;
  final SpendTotals totals;
  final List<LedgerRow> purchaseRows;
  final List<Expense> expenses;
  final Map<int, String> expenseCategories;

  bool get isEmpty => expenses.isEmpty && purchaseRows.isEmpty;
}
