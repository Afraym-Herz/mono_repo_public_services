import 'package:core/core.dart';

import 'package:doctor_clinics_app/core/finance/data/finance_guard.dart';
import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_datasource.dart';
import 'package:doctor_clinics_app/features/expenses/data/repositories/expenses_totals.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/vendor.dart';

/// Read side of [ExpensesRepositoryImpl], guarded into [FutureResult] values.
mixin ExpensesRepositoryReads {
  IExpensesDatasource get datasource;

  FutureResult<List<Expense>> getExpenses({DateTime? from, DateTime? to}) =>
      guardFinanceValue(
        'getExpenses',
        () => datasource.fetchExpenses(from: from, to: to),
      );

  FutureResult<Expense?> getExpense(int id) =>
      guardFinanceValue('getExpense', () => datasource.fetchExpense(id));

  FutureResult<List<ExpenseCategoryEntity>> getExpenseCategories() =>
      guardFinanceValue(
        'getExpenseCategories',
        datasource.fetchExpenseCategories,
      );

  FutureResult<List<Vendor>> getVendors() =>
      guardFinanceValue('getVendors', datasource.fetchAllVendors);

  FutureResult<List<Purchase>> getAllPurchases() =>
      guardFinanceValue('getAllPurchases', datasource.fetchAllPurchases);

  FutureResult<Purchase?> getPurchase(int id) =>
      guardFinanceValue('getPurchase', () => datasource.fetchPurchase(id));

  FutureResult<List<PurchaseItem>> getAllPurchaseItems() => guardFinanceValue(
    'getAllPurchaseItems',
    datasource.fetchAllPurchaseItems,
  );

  FutureResult<List<PurchasePayment>> getAllPurchasePayments() =>
      guardFinanceValue(
        'getAllPurchasePayments',
        datasource.fetchAllPurchasePayments,
      );

  FutureResult<int> getDailyExpensesPiasters(DateTime date) =>
      guardFinanceValue(
        'getDailyExpensesPiasters',
        () => sumExpensesForDay(datasource, date),
      );
}
