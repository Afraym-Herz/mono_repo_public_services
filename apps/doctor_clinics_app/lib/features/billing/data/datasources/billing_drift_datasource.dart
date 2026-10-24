import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_drift_reads.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_invoice_mapper.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_payment_expense_mapper.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_purchase_mapper.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_item.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_payment.dart'
    as entity;
import 'package:doctor_clinics_app/features/billing/domain/entities/vendor.dart'
    as entity;

/// Concrete Drift implementation of [IBillingDatasource].
class BillingDriftDatasource
    with BillingDriftReads
    implements IBillingDatasource {
  @override
  final BillingDao dao;

  BillingDriftDatasource(this.dao);

  @override
  Future<int> insertInvoice(entity.Invoice invoice) async {
    return dao.insertInvoice(BillingInvoiceMapper.toInvoiceCompanion(invoice));
  }

  @override
  Future<void> updateInvoice(entity.Invoice invoice) async {
    await dao.updateInvoice(BillingInvoiceMapper.toInvoiceCompanion(invoice));
  }

  @override
  Future<void> insertInvoiceItem(entity.InvoiceItem item) async {
    await dao.insertInvoiceItem(BillingInvoiceMapper.toItemCompanion(item));
  }

  @override
  Future<int> insertPayment(entity.Payment payment) async {
    return dao.insertPayment(
      BillingPaymentExpenseMapper.toPaymentCompanion(payment),
    );
  }

  @override
  Future<int> insertExpense(entity.Expense expense) async {
    return dao.insertExpense(
      BillingPaymentExpenseMapper.toExpenseCompanion(expense),
    );
  }

  @override
  Future<void> updateExpense(entity.Expense expense) async {
    await dao.updateExpense(
      BillingPaymentExpenseMapper.toExpenseCompanion(expense),
    );
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
    return rows.map(BillingPurchaseMapper.toDomainVendor).toList();
  }

  @override
  Future<int> insertVendor(entity.Vendor vendor) {
    return dao.insertVendor(BillingPurchaseMapper.toVendorCompanion(vendor));
  }

  @override
  Future<List<entity.Purchase>> fetchAllPurchases() async {
    final rows = await dao.getAllPurchases();
    return rows.map(BillingPurchaseMapper.toDomainPurchase).toList();
  }

  @override
  Future<int> insertPurchase(entity.Purchase purchase) {
    return dao.insertPurchase(
      BillingPurchaseMapper.toPurchaseCompanion(purchase),
    );
  }

  @override
  Future<void> insertPurchaseItem(entity.PurchaseItem item) async {
    await dao.insertPurchaseItem(BillingPurchaseMapper.toItemCompanion(item));
  }

  @override
  Future<List<entity.PurchaseItem>> fetchAllPurchaseItems() async {
    final rows = await dao.getAllPurchaseItems();
    return rows.map(BillingPurchaseMapper.toDomainItem).toList();
  }

  @override
  Future<int> insertPurchasePayment(entity.PurchasePayment payment) {
    return dao.insertPurchasePayment(
      BillingPurchaseMapper.toPaymentCompanion(payment),
    );
  }

  @override
  Future<List<entity.PurchasePayment>> fetchAllPurchasePayments() async {
    final rows = await dao.getAllPurchasePayments();
    return rows.map(BillingPurchaseMapper.toDomainPayment).toList();
  }
}
