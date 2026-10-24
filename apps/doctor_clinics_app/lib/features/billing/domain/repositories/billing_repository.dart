import 'package:core/core.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/billing_expense_category.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/vendor.dart';

/// Contract for billing, payments, purchases, and expenses.
abstract class IBillingRepository {
  //   Invoices
  FutureResult<List<Invoice>> getAllInvoices();
  FutureResult<List<Invoice>> getByPatient(int patientId);
  FutureResult<Invoice> createInvoice(Invoice invoice);
  FutureResult<void> addInvoiceItem(InvoiceItem item);
  FutureResult<List<InvoiceItem>> getInvoiceItems(int invoiceId);
  FutureResult<List<InvoiceItem>> getAllInvoiceItems();

  //   Payments
  FutureResult<List<Payment>> getPayments(int invoiceId);
  FutureResult<List<Payment>> getAllPayments({DateTime? from, DateTime? to});
  FutureResult<Payment> recordPayment(Payment payment);
  FutureResult<String> nextReceiptNumber();

  //   Debts
  FutureResult<List<Invoice>> getOutstandingInvoices();
  FutureResult<int> getPatientDebt(int patientId);

  //   Expenses
  FutureResult<List<Expense>> getExpenses({DateTime? from, DateTime? to});
  FutureResult<List<BillingExpenseCategory>> getExpenseCategories();
  FutureResult<BillingExpenseCategory> addExpenseCategory(String name);
  FutureResult<Expense> addExpense(Expense expense);
  FutureResult<void> updateExpense(Expense expense);

  //   Suppliers and purchases
  FutureResult<List<Vendor>> getVendors();
  FutureResult<Vendor> addVendor(Vendor vendor);
  FutureResult<List<Purchase>> getAllPurchases();
  FutureResult<Purchase> createPurchase(Purchase purchase);
  FutureResult<void> addPurchaseItem(PurchaseItem item);
  FutureResult<List<PurchaseItem>> getAllPurchaseItems();
  FutureResult<PurchasePayment> recordPurchasePayment(PurchasePayment payment);
  FutureResult<List<PurchasePayment>> getAllPurchasePayments();
  FutureResult<String> nextPurchaseReceiptNumber();

  //   Summaries
  FutureResult<int> getDailyRevenuePiasters(DateTime date);
  FutureResult<int> getDailyExpensesPiasters(DateTime date);
}
