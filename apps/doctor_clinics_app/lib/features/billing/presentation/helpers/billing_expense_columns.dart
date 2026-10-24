import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_layout.dart';

/// Column layout shared by the expense head and its rows.
class BillingExpenseColumns {
  BillingExpenseColumns._();

  static const int date = 12;
  static const int category = 16;
  static const int description = 30;
  static const int notes = 20;
  static const int amount = 12;

  /// Width below which the expense table scrolls horizontally.
  static const double minWidth = BillingLayout.expenseMinWidth;

  static const List<BillingExpenseHeader> headers = [
    BillingExpenseHeader('billing.expense.date', date, centered: true),
    BillingExpenseHeader('billing.expense.category', category),
    BillingExpenseHeader('billing.expense.description', description),
    BillingExpenseHeader('billing.expense.notes', notes),
    BillingExpenseHeader('billing.expense.amount', amount, centered: true),
  ];
}

/// One expense header cell: its translation key, flex weight and alignment.
class BillingExpenseHeader {
  const BillingExpenseHeader(this.labelKey, this.flex, {this.centered = false});

  final String labelKey;
  final int flex;
  final bool centered;
}
