import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/billing_table.dart';

part 'billing_dao.g.dart';

@DriftAccessor(tables: [Invoices, InvoiceItems, Payments, Expenses, ExpenseCategories])
class BillingDao extends DatabaseAccessor<AppDatabase> with _$BillingDaoMixin {
  BillingDao(super.db);

  Future<List<Invoice>> getInvoicesForPatient(int patientId) =>
      (select(invoices)..where((i) => i.patientId.equals(patientId))).get();
  Future<int> insertInvoice(InvoicesCompanion entry) => into(invoices).insert(entry);

  Future<List<InvoiceItem>> getInvoiceItems(int invoiceId) =>
      (select(invoiceItems)..where((i) => i.invoiceId.equals(invoiceId))).get();
  Future<int> insertInvoiceItem(InvoiceItemsCompanion entry) => into(invoiceItems).insert(entry);

  Future<List<Payment>> getPaymentsForInvoice(int invoiceId) =>
      (select(payments)..where((p) => p.invoiceId.equals(invoiceId))).get();
  Future<int> insertPayment(PaymentsCompanion entry) => into(payments).insert(entry);

  Future<List<Expense>> getAllExpenses() => select(expenses).get();
  Future<int> insertExpense(ExpensesCompanion entry) => into(expenses).insert(entry);
}
