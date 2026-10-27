import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_mapper.dart';
import 'package:doctor_clinics_app/features/expenses/data/datasources/expenses_purchase_mapper.dart';
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense_category.dart'
    as entity;
import 'package:doctor_clinics_app/features/expenses/domain/entities/expense.dart'
    as entity;
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase.dart'
    as entity;
import 'package:doctor_clinics_app/features/expenses/domain/entities/purchase_payment.dart'
    as entity;

/// Read queries of [ExpensesDriftDatasource], kept apart from its writes.
mixin ExpensesDriftReads {
  BillingDao get dao;

  Future<List<entity.Expense>> fetchExpenses({
    DateTime? from,
    DateTime? to,
  }) async {
    final List<Expense> rows;
    if (from != null && to != null) {
      rows = await dao.getExpensesBetween(from, to);
    } else {
      rows = await dao.getAllExpenses();
    }
    return rows.map(ExpensesMapper.toDomainExpense).toList();
  }

  Future<entity.Expense?> fetchExpense(int id) async {
    final row = await dao.getExpenseById(id);
    return row == null ? null : ExpensesMapper.toDomainExpense(row);
  }

  Future<List<entity.ExpenseCategoryEntity>> fetchExpenseCategories() async {
    final rows = await dao.getExpenseCategories();
    return rows.map(ExpensesMapper.toDomainCategory).toList();
  }

  Future<List<entity.Purchase>> fetchAllPurchases() async {
    final rows = await dao.getAllPurchases();
    return rows.map(ExpensesPurchaseMapper.toDomainPurchase).toList();
  }

  Future<entity.Purchase?> fetchPurchase(int id) async {
    final row = await dao.getPurchaseById(id);
    return row == null ? null : ExpensesPurchaseMapper.toDomainPurchase(row);
  }

  Future<List<entity.PurchasePayment>> fetchPurchasePayments(
    int purchaseId,
  ) async {
    final rows = await dao.getPurchasePaymentsForPurchase(purchaseId);
    return rows.map(ExpensesPurchaseMapper.toDomainPayment).toList();
  }
}
