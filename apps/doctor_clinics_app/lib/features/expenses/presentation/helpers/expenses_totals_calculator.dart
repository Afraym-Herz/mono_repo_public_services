import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/spend_totals.dart';

/// Aggregates the outflow figures shown on the expenses KPI cards.
class ExpensesTotalsCalculator {
  ExpensesTotalsCalculator._();

  static SpendTotals calculate({
    required List<Expense> expenses,
    required List<Purchase> purchases,
    required List<Purchase> allPurchases,
  }) {
    final expenseTotal = expenses.fold<int>(
      0,
      (total, expense) => total + expense.amountPiasters,
    );
    final purchaseTotal = purchases.fold<int>(
      0,
      (total, purchase) => total + purchase.totalPiasters,
    );
    final purchasesDue = allPurchases.fold<int>(
      0,
      (total, purchase) => total + purchase.duePiasters,
    );

    return SpendTotals(
      expenseTotal: expenseTotal,
      expenseCount: expenses.length,
      purchaseTotal: purchaseTotal,
      purchaseCount: purchases.length,
      purchasesDue: purchasesDue,
    );
  }
}
