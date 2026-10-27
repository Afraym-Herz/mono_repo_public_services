import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice_item.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

/// Raw revenue rows backing every range of the accounts dashboard.
class BillingSource {
  const BillingSource({
    required this.invoices,
    required this.payments,
    required this.items,
    required this.patientNames,
  });

  final List<Invoice> invoices;
  final List<Payment> payments;
  final List<InvoiceItem> items;
  final Map<int, String> patientNames;
}

/// Reads every revenue table once; range switching then reuses this snapshot.
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

    final items = await repository.getAllInvoiceItems();
    if (items.isLeft()) return null;

    final patients = await patientRepository.getAllPatients();
    if (patients.isLeft()) return null;

    return BillingSource(
      invoices: invoices.getOrElse(() => const []),
      payments: payments.getOrElse(() => const []),
      items: items.getOrElse(() => const []),
      patientNames: {
        for (final patient in patients.getOrElse(() => const []))
          patient.id: patient.fullName,
      },
    );
  }
}
