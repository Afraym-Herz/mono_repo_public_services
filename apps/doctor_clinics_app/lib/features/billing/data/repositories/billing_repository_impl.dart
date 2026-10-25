import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_repository_guard.dart';
import 'package:doctor_clinics_app/features/billing/data/repositories/billing_repository_reads.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_expense_category.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/vendor.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';

class BillingRepositoryImpl
    with BillingRepositoryReads
    implements IBillingRepository {
  @override
  final IBillingDatasource datasource;

  BillingRepositoryImpl({required this.datasource});

  @override
  FutureResult<Invoice> createInvoice(Invoice invoice) => guardBillingValue(
    'createInvoice',
    () async => invoice.copyWith(id: await datasource.insertInvoice(invoice)),
  );

  @override
  FutureResult<void> addInvoiceItem(InvoiceItem item) => guardBillingVoid(
    'addInvoiceItem',
    () => datasource.insertInvoiceItem(item),
  );

  @override
  FutureResult<Payment> recordPayment(Payment payment) => guardBillingValue(
    'recordPayment',
    () async => payment.copyWith(id: await datasource.insertPayment(payment)),
  );

  @override
  FutureResult<String> nextReceiptNumber() => guardBillingValue(
    'nextReceiptNumber',
    () async => 'RCP-${DateTime.now().millisecondsSinceEpoch}',
  );

  @override
  FutureResult<Expense> addExpense(Expense expense) => guardBillingValue(
    'addExpense',
    () async => expense.copyWith(id: await datasource.insertExpense(expense)),
  );

  @override
  FutureResult<void> updateExpense(Expense expense) => guardBillingVoid(
    'updateExpense',
    () => datasource.updateExpense(expense),
  );

  @override
  FutureResult<BillingExpenseCategory> addExpenseCategory(String name) =>
      guardBillingValue('addExpenseCategory', () async {
        final id = await datasource.insertExpenseCategory(name);
        return BillingExpenseCategory(id: id, name: name);
      });

  @override
  FutureResult<Vendor> addVendor(Vendor vendor) => guardBillingValue(
    'addVendor',
    () async => vendor.copyWith(id: await datasource.insertVendor(vendor)),
  );

  @override
  FutureResult<Purchase> createPurchase(Purchase purchase) =>
      guardBillingValue(
        'createPurchase',
        () async =>
            purchase.copyWith(id: await datasource.insertPurchase(purchase)),
      );

  @override
  FutureResult<void> addPurchaseItem(PurchaseItem item) => guardBillingVoid(
    'addPurchaseItem',
    () => datasource.insertPurchaseItem(item),
  );

  @override
  FutureResult<PurchasePayment> recordPurchasePayment(
    PurchasePayment payment,
  ) => guardBillingValue(
    'recordPurchasePayment',
    () async => payment.copyWith(
      id: await datasource.insertPurchasePayment(payment),
    ),
  );

  @override
  FutureResult<String> nextPurchaseReceiptNumber() => guardBillingValue(
    'nextPurchaseReceiptNumber',
    () async => 'PUR-RCP-${DateTime.now().millisecondsSinceEpoch}',
  );
}
