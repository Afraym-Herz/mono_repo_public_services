import 'package:doctor_clinics_app/features/billing/data/datasources/billing_datasource.dart';

/// Sums `amountPiasters` for every expense inside [date]'s day window.
Future<int> sumExpensesForDay(
  IBillingDatasource datasource,
  DateTime date,
) async {
  final start = DateTime(date.year, date.month, date.day);
  final end = start.add(const Duration(days: 1));
  final expenses = await datasource.fetchExpenses(from: start, to: end);
  var total = 0;
  for (final e in expenses) {
    total += e.amountPiasters;
  }
  return total;
}

/// Sums `duePiasters` across every invoice of [patientId].
Future<int> sumPatientDebt(IBillingDatasource datasource, int patientId) async {
  final invoices = await datasource.fetchByPatient(patientId);
  var debt = 0;
  for (final inv in invoices) {
    debt += inv.duePiasters;
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
  for (final p in payments) {
    total += p.amountPiasters;
  }
  return total;
}
