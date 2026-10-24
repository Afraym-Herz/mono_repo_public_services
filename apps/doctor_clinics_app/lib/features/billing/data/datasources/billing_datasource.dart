import 'package:doctor_clinics_app/features/billing/domain/entities/billing_expense_category.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/expense.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/purchase_payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/vendor.dart';

/// Local data-source for billing (Drift).
abstract class IBillingDatasource {
  Future<List<Invoice>> fetchAllInvoices();
  Future<List<Invoice>> fetchByPatient(int patientId);
  Future<int> insertInvoice(Invoice invoice);
  Future<void> updateInvoice(Invoice invoice);

  Future<void> insertInvoiceItem(InvoiceItem item);
  Future<List<InvoiceItem>> fetchInvoiceItems(int invoiceId);
  Future<List<InvoiceItem>> fetchAllInvoiceItems();

  Future<List<Payment>> fetchPayments(int invoiceId);
  Future<List<Payment>> fetchAllPayments({DateTime? from, DateTime? to});
  Future<int> insertPayment(Payment payment);

  Future<List<Invoice>> fetchOutstanding();

  Future<List<Expense>> fetchExpenses({DateTime? from, DateTime? to});
  Future<List<BillingExpenseCategory>> fetchExpenseCategories();
  Future<int> insertExpenseCategory(String name);
  Future<int> insertExpense(Expense expense);
  Future<void> updateExpense(Expense expense);

  Future<List<Vendor>> fetchAllVendors();
  Future<int> insertVendor(Vendor vendor);

  Future<List<Purchase>> fetchAllPurchases();
  Future<int> insertPurchase(Purchase purchase);

  Future<void> insertPurchaseItem(PurchaseItem item);
  Future<List<PurchaseItem>> fetchAllPurchaseItems();

  Future<int> insertPurchasePayment(PurchasePayment payment);
  Future<List<PurchasePayment>> fetchAllPurchasePayments();
}
