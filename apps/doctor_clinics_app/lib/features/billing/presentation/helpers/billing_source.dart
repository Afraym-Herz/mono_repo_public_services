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
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

/// Raw rows backing every range of the accounts dashboard.
class BillingSource {
  const BillingSource({
    required this.invoices,
    required this.payments,
    required this.expenses,
    required this.items,
    required this.categories,
    required this.patientNames,
    required this.purchases,
    required this.purchaseItems,
    required this.purchasePayments,
    required this.vendors,
  });

  final List<Invoice> invoices;
  final List<Payment> payments;
  final List<Expense> expenses;
  final List<InvoiceItem> items;
  final List<BillingExpenseCategory> categories;
  final Map<int, String> patientNames;
  final List<Purchase> purchases;
  final List<PurchaseItem> purchaseItems;
  final List<PurchasePayment> purchasePayments;
  final List<Vendor> vendors;
}

/// Reads every billing table once; range switching then reuses this snapshot.
class BillingSourceLoader {
  BillingSourceLoader._();

  static Future<BillingSource?> load({
    required IBillingRepository repository,
    required PatientRepository patientRepository,
  }) async {
    final invoices = await repository.getAllInvoices();
    if (invoices.isLeft()) return null;

    final payments = await repository.getAllPayments();
    if (payments.isLeft()) return null;

    final expenses = await repository.getExpenses();
    if (expenses.isLeft()) return null;

    final items = await repository.getAllInvoiceItems();
    if (items.isLeft()) return null;

    final categories = await repository.getExpenseCategories();
    if (categories.isLeft()) return null;

    final patients = await patientRepository.getAllPatients();
    if (patients.isLeft()) return null;

    final purchases = await repository.getAllPurchases();
    if (purchases.isLeft()) return null;

    final purchaseItems = await repository.getAllPurchaseItems();
    if (purchaseItems.isLeft()) return null;

    final purchasePayments = await repository.getAllPurchasePayments();
    if (purchasePayments.isLeft()) return null;

    final vendors = await repository.getVendors();
    if (vendors.isLeft()) return null;

    return BillingSource(
      invoices: invoices.getOrElse(() => const []),
      payments: payments.getOrElse(() => const []),
      expenses: expenses.getOrElse(() => const []),
      items: items.getOrElse(() => const []),
      categories: categories.getOrElse(() => const []),
      patientNames: {
        for (final patient in patients.getOrElse(() => const []))
          patient.id: patient.fullName,
      },
      purchases: purchases.getOrElse(() => const []),
      purchaseItems: purchaseItems.getOrElse(() => const []),
      purchasePayments: purchasePayments.getOrElse(() => const []),
      vendors: vendors.getOrElse(() => const []),
    );
  }
}
