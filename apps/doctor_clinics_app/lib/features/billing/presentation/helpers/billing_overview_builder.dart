import 'package:core/core.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_expense_category.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_overview.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_range.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/vendor.dart';

import 'billing_breakdown_builder.dart';
import 'billing_ledger_builder.dart';
import 'billing_purchase_ledger_builder.dart';
import 'billing_totals_calculator.dart';

/// Turns the raw billing rows into the range-scoped [BillingOverview] the
/// accounts screen renders.
class BillingOverviewBuilder {
  BillingOverviewBuilder._();

  static BillingOverview build({
    required BillingRange range,
    required List<Invoice> invoices,
    required List<Payment> payments,
    required List<Expense> expenses,
    required List<InvoiceItem> items,
    required List<BillingExpenseCategory> categories,
    required Map<int, String> patientNames,
    required List<Purchase> purchases,
    required List<PurchaseItem> purchaseItems,
    required List<PurchasePayment> purchasePayments,
    required List<Vendor> vendors,
    required DateTime now,
  }) {
    final start = range.start(now);
    final end = range.end(now);
    final activeInvoices = invoices
        .where(
          (invoice) => invoice.status != AppConstants.invoiceStatusCancelled,
        )
        .toList();
    final activeIds = activeInvoices.map((invoice) => invoice.id).toSet();
    final windowInvoices = activeInvoices
        .where((invoice) => _within(invoice.invoiceDate, start, end))
        .toList();
    final windowPayments = payments
        .where(
          (payment) =>
              activeIds.contains(payment.invoiceId) &&
              _within(payment.paymentDate, start, end),
        )
        .toList();
    final paymentInvoiceIds = windowPayments
        .map((payment) => payment.invoiceId)
        .toSet();
    final ledgerInvoices = activeInvoices
        .where(
          (invoice) =>
              _within(invoice.invoiceDate, start, end) ||
              paymentInvoiceIds.contains(invoice.id),
        )
        .toList();
    final windowExpenses = expenses
        .where((expense) => _within(expense.expenseDate, start, end))
        .toList();

    final activePurchases = purchases
        .where(
          (purchase) => purchase.status != AppConstants.invoiceStatusCancelled,
        )
        .toList();
    final windowPurchases = activePurchases
        .where((purchase) => _within(purchase.purchaseDate, start, end))
        .toList();
    final windowPurchasePayments = purchasePayments
        .where((payment) => _within(payment.paymentDate, start, end))
        .toList();
    final paidPurchaseIds = windowPurchasePayments
        .map((payment) => payment.purchaseId)
        .toSet();
    final purchaseRowsSource = activePurchases
        .where(
          (purchase) =>
              _within(purchase.purchaseDate, start, end) ||
              paidPurchaseIds.contains(purchase.id),
        )
        .toList();

    final totals = BillingTotalsCalculator.calculate(
      invoices: windowInvoices,
      allInvoices: activeInvoices,
      payments: windowPayments,
      allPayments: payments,
      expenses: windowExpenses,
      purchases: windowPurchases,
      allPurchases: activePurchases,
    );
    final statements = BillingLedgerBuilder.statements(items);

    return BillingOverview(
      range: range,
      totals: totals,
      ledgerRows: BillingLedgerBuilder.build(
        invoices: ledgerInvoices,
        allPayments: payments,
        patientNames: patientNames,
        statements: statements,
      ),
      purchaseRows: BillingPurchaseLedgerBuilder.build(
        purchases: purchaseRowsSource,
        items: purchaseItems,
        payments: purchasePayments,
        vendorNames: {for (final vendor in vendors) vendor.id: vendor.name},
      ),
      expenses: windowExpenses,
      series: BillingBreakdownBuilder.series(
        range: range,
        payments: windowPayments,
        now: now,
      ),
      cash: BillingBreakdownBuilder.cash(
        windowPayments,
        windowExpenses.map((expense) => expense.amountPiasters).toList(),
        purchasePayments: windowPurchasePayments,
      ),
      invoices: windowInvoices,
      expenseCategories: {
        for (final category in categories) category.id: category.name,
      },
    );
  }

  static bool _within(DateTime value, DateTime start, DateTime end) =>
      !value.isBefore(start) && value.isBefore(end);
}
