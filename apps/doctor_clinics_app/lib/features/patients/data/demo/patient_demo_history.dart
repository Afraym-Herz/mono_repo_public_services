import 'package:core/core.dart';
import 'package:drift/drift.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/consultation_dao.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_patient.dart';

/// Adds the demo patient's clinical and financial history, one block at a time.
///
/// Each block is skipped when the patient already has data, so re-running the
/// seeder never duplicates consultations or invoices.
class PatientDemoHistory {
  const PatientDemoHistory._();

  static Future<void> seedConsultation(
    ConsultationDao dao,
    int patientId,
    QueueDemoPatient patient,
    DateTime now,
  ) async {
    final daysAgo = patient.lastVisitDaysAgo;
    if (daysAgo == null) return;
    final existing = await dao.getConsultationsForPatient(patientId);
    if (existing.isNotEmpty) return;

    final visitDate = now.subtract(Duration(days: daysAgo));
    await dao.insertConsultation(
      ConsultationsCompanion.insert(
        patientId: patientId,
        visitDate: visitDate,
        followUpDate: Value(_followUpDate(patient.followUpInDays, now)),
        status: AppConstants.consultationStatusFinalized,
        createdBy: 'demo',
        finalizedAt: Value(visitDate),
      ),
    );
  }

  static Future<void> seedInvoice(
    BillingDao dao,
    int patientId,
    QueueDemoPatient patient,
    String fileNumber,
  ) async {
    final debt = patient.debtPiasters;
    if (debt == null || debt <= 0) return;
    final existing = await dao.getInvoicesForPatient(patientId);
    if (existing.isNotEmpty) return;

    await dao.insertInvoice(
      InvoicesCompanion.insert(
        patientId: Value(patientId),
        invoiceNumber: 'DEMO-INV-$fileNumber',
        totalAmount: debt,
        discountAmount: 0,
        netAmount: 0,
        status: AppConstants.invoiceStatusPending,
      ),
    );
  }

  static DateTime? _followUpDate(int? days, DateTime now) =>
      days == null ? null : now.add(Duration(days: days));
}
