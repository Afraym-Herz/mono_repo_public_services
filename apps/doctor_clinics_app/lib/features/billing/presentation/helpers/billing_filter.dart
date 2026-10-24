import 'package:doctor_clinics_app/features/billing/domain/entities/billing_ledger_row.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';

/// Case-insensitive search shared by the payments, purchases and expenses logs.
class BillingFilter {
  BillingFilter._();

  static List<BillingLedgerRow> rows(
    List<BillingLedgerRow> rows,
    String query,
  ) {
    final needle = query.trim().toLowerCase();
    if (needle.isEmpty) return rows;
    return rows.where((row) {
      return row.counterparty.toLowerCase().contains(needle) ||
          row.number.toLowerCase().contains(needle) ||
          row.receiptNumber.toLowerCase().contains(needle) ||
          row.statement.toLowerCase().contains(needle);
    }).toList();
  }

  static List<Expense> expenses(
    List<Expense> expenses,
    String query,
    String Function(Expense expense) categoryName,
  ) {
    final needle = query.trim().toLowerCase();
    if (needle.isEmpty) return expenses;
    return expenses.where((expense) {
      return expense.description.toLowerCase().contains(needle) ||
          categoryName(expense).toLowerCase().contains(needle) ||
          expense.amountPiasters.toString().contains(needle);
    }).toList();
  }
}
