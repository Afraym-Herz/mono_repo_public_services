import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/vendor.dart';

/// Local data-source for expenses, suppliers and supplier bills (Drift).
abstract class IExpensesDatasource {
  Future<List<Expense>> fetchExpenses({DateTime? from, DateTime? to});
  Future<Expense?> fetchExpense(int id);
  Future<List<ExpenseCategoryEntity>> fetchExpenseCategories();
  Future<int> insertExpenseCategory(String name);
  Future<int> insertExpense(Expense expense);
  Future<void> updateExpense(Expense expense);

  Future<List<Vendor>> fetchAllVendors();
  Future<int> insertVendor(Vendor vendor);

  Future<List<Purchase>> fetchAllPurchases();
  Future<Purchase?> fetchPurchase(int id);
  Future<int> insertPurchase(Purchase purchase);
  Future<void> updatePurchase(Purchase purchase);

  Future<void> insertPurchaseItem(PurchaseItem item);
  Future<List<PurchaseItem>> fetchAllPurchaseItems();

  Future<int> insertPurchasePayment(PurchasePayment payment);
  Future<List<PurchasePayment>> fetchAllPurchasePayments();
  Future<List<PurchasePayment>> fetchPurchasePayments(int purchaseId);
}
