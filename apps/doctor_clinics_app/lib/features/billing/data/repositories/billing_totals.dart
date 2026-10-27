import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';

/// Sums `duePiasters` across every invoice of [patientId].
Future<int> sumPatientDebt(IBillingDatasource datasource, int patientId) async {
  final invoices = await datasource.fetchByPatient(patientId);
  var debt = 0;
  for (final invoice in invoices) {
    debt += invoice.duePiasters;
  }
  return debt;
}

/// Sums `amountPiasters` for every payment inside [date]'s day window.
Future<int> sumPaymentsForDay(
  IBillingDatasource datasource,
  DateTime date,
) async {
  final start = DateTime(date.year, date.month, date.day);
  final end = start.add(const Duration(days: 1));
  final payments = await datasource.fetchAllPayments(from: start, to: end);
  var total = 0;
  for (final payment in payments) {
    total += payment.amountPiasters;
  }
  return total;
}
