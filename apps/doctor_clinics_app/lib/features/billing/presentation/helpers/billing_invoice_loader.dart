import 'package:doctor_clinics_app/features/billing/domain/entities/billing_invoice_detail.dart';
import 'package:doctor_clinics_app/features/billing/domain/entities/invoice.dart';
import 'package:doctor_clinics_app/features/billing/domain/repositories/billing_repository.dart';
import 'package:doctor_clinics_app/features/patients/domain/repositories/patient_repository.dart';

/// Outcome of loading one invoice with its items, receipts and party name.
class BillingInvoiceLoad {
  const BillingInvoiceLoad({this.detail, this.error});

  final BillingInvoiceDetail? detail;
  final String? error;
}

/// Reads the single-invoice modal model, mapping failures to message keys.
Future<BillingInvoiceLoad> loadBillingInvoiceDetail({
  required IBillingRepository repository,
  required PatientRepository patientRepository,
  required int invoiceId,
}) async {
  final invoiceResult = await repository.getInvoice(invoiceId);
  if (invoiceResult.isLeft()) {
    return const BillingInvoiceLoad(error: 'billing.error.load');
  }
  final invoice = invoiceResult.getOrElse(() => null);
  if (invoice == null) {
    return const BillingInvoiceLoad(error: 'billing.invoice_detail.not_found');
  }

  final itemsResult = await repository.getInvoiceItems(invoiceId);
  final paymentsResult = await repository.getPayments(invoiceId);
  if (itemsResult.isLeft() || paymentsResult.isLeft()) {
    return const BillingInvoiceLoad(error: 'billing.error.load');
  }

  return BillingInvoiceLoad(
    detail: BillingInvoiceDetail(
      invoice: invoice,
      partyName: await _partyName(patientRepository, invoice),
      items: itemsResult.getOrElse(() => const []),
      payments: paymentsResult.getOrElse(() => const []),
    ),
  );
}

Future<String> _partyName(
  PatientRepository patientRepository,
  Invoice invoice,
) async {
  final patientId = invoice.patientId;
  if (patientId != null) {
    final patientResult = await patientRepository.getPatientById(patientId);
    final name = patientResult.getOrElse(() => null)?.fullName.trim() ?? '';
    if (name.isNotEmpty) return name;
  }
  return invoice.customerName?.trim() ?? '';
}
