import 'dart:math' as math;

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_totals.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase.dart';

/// Aggregates the figures shown on the accounts KPI cards.
class BillingTotalsCalculator {
  BillingTotalsCalculator._();

  static BillingTotals calculate({
    required List<Invoice> invoices,
    required List<Invoice> allInvoices,
    required List<Payment> payments,
    required List<Payment> allPayments,
    required List<Expense> expenses,
    required List<Purchase> purchases,
    required List<Purchase> allPurchases,
  }) {
    final totalInvoiced = _sumInvoices(invoices);
    final collected = _sumPayments(payments);
    final remaining = invoices.fold<int>(
      0,
      (total, invoice) => total + _dueFor(invoice, allPayments),
    );
    final outstanding = allInvoices.fold<int>(
      0,
      (total, invoice) => total + _dueFor(invoice, allPayments),
    );
    final debtors = <int, int>{};
    for (final invoice in allInvoices) {
      final patientId = invoice.patientId;
      if (patientId == null) continue;
      final due = _dueFor(invoice, allPayments);
      if (due <= 0) continue;
      debtors.update(patientId, (total) => total + due, ifAbsent: () => due);
    }
    final topDebt = debtors.values.fold<int>(
      0,
      (maximum, due) => math.max(maximum, due),
    );

    return BillingTotals(
      totalInvoiced: totalInvoiced,
      invoiceCount: invoices.length,
      collected: collected,
      remaining: remaining,
      expenseTotal: _sumExpenses(expenses),
      expenseCount: expenses.length,
      purchaseTotal: _sumPurchases(purchases),
      purchaseCount: purchases.length,
      purchasesDue: allPurchases.fold<int>(
        0,
        (total, purchase) => total + purchase.duePiasters,
      ),
      outstanding: outstanding,
      debtorCount: debtors.length,
      topDebt: topDebt,
    );
  }

  static int _sumInvoices(List<Invoice> invoices) =>
      invoices.fold(0, (total, invoice) => total + invoice.totalPiasters);

  static int _sumPayments(List<Payment> payments) =>
      payments.fold(0, (total, payment) => total + payment.amountPiasters);

  static int _sumExpenses(List<Expense> expenses) =>
      expenses.fold(0, (total, expense) => total + expense.amountPiasters);

  static int _sumPurchases(List<Purchase> purchases) =>
      purchases.fold(0, (total, purchase) => total + purchase.totalPiasters);

  static int _dueFor(Invoice invoice, List<Payment> payments) {
    final paid = payments
        .where((payment) => payment.invoiceId == invoice.id)
        .fold(0, (total, payment) => total + payment.amountPiasters);
    final effectivePaid = paid > 0 ? paid : invoice.paidPiasters;
    return math.max(0, invoice.totalPiasters - effectivePaid);
  }
}
