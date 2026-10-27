import 'package:doctor_clinics_app/core/finance/domain/finance_range.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expenses_overview.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/vendor.dart';

import 'expenses_totals_calculator.dart';
import 'purchase_ledger_builder.dart';

/// Turns the raw outflow rows into the range-scoped [ExpensesOverview] the
/// expenses screen renders.
class ExpensesOverviewBuilder {
  ExpensesOverviewBuilder._();

  static ExpensesOverview build({
    required FinanceRange range,
    required List<Expense> expenses,
    required List<ExpenseCategoryEntity> categories,
    required List<Purchase> purchases,
    required List<PurchaseItem> purchaseItems,
    required List<PurchasePayment> purchasePayments,
    required List<Vendor> vendors,
    required DateTime now,
  }) {
    final start = range.start(now);
    final end = range.end(now);
    final windowExpenses = expenses
        .where((expense) => _within(expense.expenseDate, start, end))
        .toList();
    final paidPurchaseIds = purchasePayments
        .where((payment) => _within(payment.paymentDate, start, end))
        .map((payment) => payment.purchaseId)
        .toSet();
    final windowPurchases = purchases
        .where(
          (purchase) =>
              _within(purchase.purchaseDate, start, end) ||
              paidPurchaseIds.contains(purchase.id),
        )
        .toList();

    return ExpensesOverview(
      range: range,
      totals: ExpensesTotalsCalculator.calculate(
        expenses: windowExpenses,
        purchases: windowPurchases,
        allPurchases: purchases,
      ),
      purchaseRows: PurchaseLedgerBuilder.build(
        purchases: windowPurchases,
        items: purchaseItems,
        payments: purchasePayments,
        vendorNames: {
          for (final vendor in vendors) vendor.id: vendor.name,
        },
      ),
      expenses: windowExpenses,
      expenseCategories: {
        for (final category in categories) category.id: category.name,
      },
    );
  }

  static bool _within(DateTime value, DateTime start, DateTime end) =>
      !value.isBefore(start) && value.isBefore(end);
}
