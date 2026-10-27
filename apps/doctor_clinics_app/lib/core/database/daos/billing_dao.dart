import 'package:core/core.dart';
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/billing_table.dart';

part 'billing_dao.g.dart';

@DriftAccessor(
  tables: [
    Invoices,
    InvoiceItems,
    Payments,
    Expenses,
    ExpenseCategories,
    Vendors,
    Purchases,
    PurchaseItems,
    PurchasePayments,
  ],
)
class BillingDao extends DatabaseAccessor<AppDatabase> with _$BillingDaoMixin {
  BillingDao(super.db);

  Future<List<Invoice>> getAllInvoices() => select(invoices).get();
  Future<Invoice?> getInvoiceById(int id) =>
      (select(invoices)..where((i) => i.id.equals(id))).getSingleOrNull();
  Future<List<Invoice>> getInvoicesForPatient(int patientId) =>
      (select(invoices)..where((i) => i.patientId.equals(patientId))).get();
  Future<List<Invoice>> getOutstandingInvoices() =>
      (select(invoices)..where(
            (i) =>
                i.status.equals(AppConstants.invoiceStatusPending) |
                i.status.equals(AppConstants.invoiceStatusPartiallyPaid),
          ))
          .get();
  Future<int> insertInvoice(InvoicesCompanion entry) =>
      into(invoices).insert(entry);
  Future<bool> updateInvoice(InvoicesCompanion entry) =>
      update(invoices).replace(entry);
  Future<int> insertExpenseCategory(ExpenseCategoriesCompanion entry) =>
      into(expenseCategories).insert(entry);

  Future<List<InvoiceItem>> getInvoiceItems(int invoiceId) =>
      (select(invoiceItems)..where((i) => i.invoiceId.equals(invoiceId))).get();
  Future<List<InvoiceItem>> getAllInvoiceItems() => select(invoiceItems).get();
  Future<int> insertInvoiceItem(InvoiceItemsCompanion entry) =>
      into(invoiceItems).insert(entry);

  Future<List<Payment>> getPaymentsForInvoice(int invoiceId) =>
      (select(payments)..where((p) => p.invoiceId.equals(invoiceId))).get();
  Future<List<Payment>> getAllPayments() => select(payments).get();
  Future<List<Payment>> getPaymentsBetween(DateTime from, DateTime to) =>
      (select(payments)..where(
            (p) =>
                p.createdAt.isBiggerOrEqualValue(from) &
                p.createdAt.isSmallerThanValue(to),
          ))
          .get();
  Future<int> insertPayment(PaymentsCompanion entry) =>
      into(payments).insert(entry);

  Future<List<Expense>> getAllExpenses() => select(expenses).get();
  Future<Expense?> getExpenseById(int id) =>
      (select(expenses)..where((e) => e.id.equals(id))).getSingleOrNull();
  Future<List<ExpenseCategory>> getExpenseCategories() =>
      select(expenseCategories).get();
  Future<List<Expense>> getExpensesBetween(DateTime from, DateTime to) =>
      (select(expenses)..where(
            (e) =>
                e.expenseDate.isBiggerOrEqualValue(from) &
                e.expenseDate.isSmallerThanValue(to),
          ))
          .get();
  Future<int> insertExpense(ExpensesCompanion entry) =>
      into(expenses).insert(entry);
  Future<bool> updateExpense(ExpensesCompanion entry) =>
      update(expenses).replace(entry);

  Future<List<Vendor>> getAllVendors() => select(vendors).get();
  Future<int> insertVendor(VendorsCompanion entry) =>
      into(vendors).insert(entry);

  Future<List<Purchase>> getAllPurchases() => select(purchases).get();
  Future<Purchase?> getPurchaseById(int id) =>
      (select(purchases)..where((p) => p.id.equals(id))).getSingleOrNull();
  Future<int> insertPurchase(PurchasesCompanion entry) =>
      into(purchases).insert(entry);
  Future<bool> updatePurchase(PurchasesCompanion entry) =>
      update(purchases).replace(entry);

  Future<List<PurchaseItem>> getAllPurchaseItems() =>
      select(purchaseItems).get();
  Future<List<PurchaseItem>> getPurchaseItems(int purchaseId) =>
      (select(purchaseItems)
            ..where((item) => item.purchaseId.equals(purchaseId)))
          .get();
  Future<int> insertPurchaseItem(PurchaseItemsCompanion entry) =>
      into(purchaseItems).insert(entry);

  Future<List<PurchasePayment>> getAllPurchasePayments() =>
      select(purchasePayments).get();
  Future<List<PurchasePayment>> getPurchasePaymentsForPurchase(
    int purchaseId,
  ) =>
      (select(purchasePayments)
            ..where((payment) => payment.purchaseId.equals(purchaseId)))
          .get();
  Future<int> insertPurchasePayment(PurchasePaymentsCompanion entry) =>
      into(purchasePayments).insert(entry);
}
