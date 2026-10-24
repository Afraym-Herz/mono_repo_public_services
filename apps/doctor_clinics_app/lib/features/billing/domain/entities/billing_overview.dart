import 'package:doctor_clinics_app/features/billing/domain/entities/billing_breakdowns.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_ledger_row.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_range.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_totals.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';

/// Read model consumed by the accounts dashboard.
class BillingOverview {
  const BillingOverview({
    required this.range,
    required this.totals,
    required this.ledgerRows,
    required this.purchaseRows,
    required this.expenses,
    required this.series,
    required this.cash,
    required this.invoices,
    required this.expenseCategories,
  });

  final BillingRange range;
  final BillingTotals totals;
  final List<BillingLedgerRow> ledgerRows;
  final List<BillingLedgerRow> purchaseRows;
  final List<Expense> expenses;
  final List<BillingSeriesPoint> series;
  final BillingCashSummary cash;
  final List<Invoice> invoices;
  final Map<int, String> expenseCategories;

  bool get isEmpty =>
      invoices.isEmpty &&
      purchaseRows.isEmpty &&
      expenses.isEmpty &&
      ledgerRows.isEmpty;
}
