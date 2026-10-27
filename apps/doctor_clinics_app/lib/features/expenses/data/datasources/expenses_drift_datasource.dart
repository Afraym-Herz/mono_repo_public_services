import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_datasource.dart';
import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_drift_reads.dart';
import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_mapper.dart';
import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_purchase_mapper.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart'
    as entity;
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart'
    as entity;
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_payment.dart'
    as entity;
import 'package:doctor_clinics_app/features/expenses/domain/entities/vendor.dart'
    as entity;

/// Concrete Drift implementation of [IExpensesDatasource].
class ExpensesDriftDatasource
    with ExpensesDriftReads
    implements IExpensesDatasource {
  @override
  final BillingDao dao;

  ExpensesDriftDatasource(this.dao);

  @override
  Future<int> insertExpense(entity.Expense expense) {
    return dao.insertExpense(ExpensesMapper.toExpenseCompanion(expense));
  }

  @override
  Future<void> updateExpense(entity.Expense expense) async {
    await dao.updateExpense(ExpensesMapper.toExpenseCompanion(expense));
  }

  @override
  Future<int> insertExpenseCategory(String name) {
    return dao.insertExpenseCategory(
      ExpenseCategoriesCompanion.insert(name: name),
    );
  }

  @override
  Future<List<entity.Vendor>> fetchAllVendors() async {
    final rows = await dao.getAllVendors();
    return rows.map(ExpensesPurchaseMapper.toDomainVendor).toList();
  }

  @override
  Future<int> insertVendor(entity.Vendor vendor) {
    return dao.insertVendor(ExpensesPurchaseMapper.toVendorCompanion(vendor));
  }

  @override
  Future<int> insertPurchase(entity.Purchase purchase) {
    return dao.insertPurchase(
      ExpensesPurchaseMapper.toPurchaseCompanion(purchase),
    );
  }

  @override
  Future<void> updatePurchase(entity.Purchase purchase) async {
    await dao.updatePurchase(
      ExpensesPurchaseMapper.toPurchaseCompanion(purchase),
    );
  }

  @override
  Future<void> insertPurchaseItem(entity.PurchaseItem item) async {
    await dao.insertPurchaseItem(ExpensesPurchaseMapper.toItemCompanion(item));
  }

  @override
  Future<List<entity.PurchaseItem>> fetchAllPurchaseItems() async {
    final rows = await dao.getAllPurchaseItems();
    return rows.map(ExpensesPurchaseMapper.toDomainItem).toList();
  }

  @override
  Future<int> insertPurchasePayment(entity.PurchasePayment payment) {
    return dao.insertPurchasePayment(
      ExpensesPurchaseMapper.toPaymentCompanion(payment),
    );
  }

  @override
  Future<List<entity.PurchasePayment>> fetchAllPurchasePayments() async {
    final rows = await dao.getAllPurchasePayments();
    return rows.map(ExpensesPurchaseMapper.toDomainPayment).toList();
  }
}
