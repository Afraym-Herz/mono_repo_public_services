import 'package:core/core.dart';

import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/vendor.dart';

/// Contract for clinic expenses, suppliers and supplier bills.
abstract class IExpensesRepository {
  //   Expenses
  FutureResult<List<Expense>> getExpenses({DateTime? from, DateTime? to});
  FutureResult<Expense?> getExpense(int id);
  FutureResult<List<ExpenseCategoryEntity>> getExpenseCategories();
  FutureResult<ExpenseCategoryEntity> addExpenseCategory(String name);
  FutureResult<Expense> addExpense(Expense expense);
  FutureResult<void> updateExpense(Expense expense);

  //   Suppliers and purchases
  FutureResult<List<Vendor>> getVendors();
  FutureResult<Vendor> addVendor(Vendor vendor);
  FutureResult<List<Purchase>> getAllPurchases();
  FutureResult<Purchase?> getPurchase(int id);
  FutureResult<Purchase> createPurchase(Purchase purchase);
  FutureResult<void> addPurchaseItem(PurchaseItem item);
  FutureResult<List<PurchaseItem>> getAllPurchaseItems();
  FutureResult<PurchasePayment> recordPurchasePayment(PurchasePayment payment);
  FutureResult<List<PurchasePayment>> getAllPurchasePayments();
  FutureResult<String> nextPurchaseReceiptNumber();

  //   Summaries
  FutureResult<int> getDailyExpensesPiasters(DateTime date);
}
