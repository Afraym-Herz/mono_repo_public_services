import 'package:doctor_clinics_app/core/finance/helpers/finance_layout.dart';

/// Column layout shared by the expense head and its rows.
class ExpenseColumns {
  ExpenseColumns._();

  static const int date = 12;
  static const int category = 16;
  static const int description = 30;
  static const int notes = 20;
  static const int amount = 12;

  /// Width below which the expense table scrolls horizontally.
  static const double minWidth = FinanceLayout.expenseMinWidth;

  static const List<ExpenseHeader> headers = [
    ExpenseHeader('billing.expense.date', date, centered: true),
    ExpenseHeader('billing.expense.category', category),
    ExpenseHeader('billing.expense.description', description),
    ExpenseHeader('billing.expense.notes', notes),
    ExpenseHeader('billing.expense.amount', amount, centered: true),
  ];
}

/// One expense header cell: its translation key, flex weight and alignment.
class ExpenseHeader {
  const ExpenseHeader(this.labelKey, this.flex, {this.centered = false});

  final String labelKey;
  final int flex;
  final bool centered;
}
