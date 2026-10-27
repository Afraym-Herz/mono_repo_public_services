import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/vendor.dart';
import 'package:doctor_clinics_app/features/expenses/domain/repositories/expenses_repository.dart';

/// Raw outflow rows backing every range of the expenses dashboard.
class ExpensesSource {
  const ExpensesSource({
    required this.expenses,
    required this.categories,
    required this.purchases,
    required this.purchaseItems,
    required this.purchasePayments,
    required this.vendors,
  });

  final List<Expense> expenses;
  final List<ExpenseCategoryEntity> categories;
  final List<Purchase> purchases;
  final List<PurchaseItem> purchaseItems;
  final List<PurchasePayment> purchasePayments;
  final List<Vendor> vendors;
}

/// Reads every outflow table once; range switching then reuses this snapshot.
class ExpensesSourceLoader {
  ExpensesSourceLoader._();

  static Future<ExpensesSource?> load({
    required IExpensesRepository repository,
  }) async {
    final expenses = await repository.getExpenses();
    if (expenses.isLeft()) return null;

    final categories = await repository.getExpenseCategories();
    if (categories.isLeft()) return null;

    final purchases = await repository.getAllPurchases();
    if (purchases.isLeft()) return null;

    final purchaseItems = await repository.getAllPurchaseItems();
    if (purchaseItems.isLeft()) return null;

    final purchasePayments = await repository.getAllPurchasePayments();
    if (purchasePayments.isLeft()) return null;

    final vendors = await repository.getVendors();
    if (vendors.isLeft()) return null;

    return ExpensesSource(
      expenses: expenses.getOrElse(() => const []),
      categories: categories.getOrElse(() => const []),
      purchases: purchases.getOrElse(() => const []),
      purchaseItems: purchaseItems.getOrElse(() => const []),
      purchasePayments: purchasePayments.getOrElse(() => const []),
      vendors: vendors.getOrElse(() => const []),
    );
  }
}
