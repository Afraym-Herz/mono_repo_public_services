import 'package:doctor_clinics_app/core/database/daos/billing_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/consultation_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_patient.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_store.dart';
import 'package:doctor_clinics_app/features/patients/data/demo/patient_demo_history.dart';
import 'package:doctor_clinics_app/features/patients/data/demo/patient_demo_profile.dart';

/// Seeds the patient register behind the offline demo clinic day.
///
/// The shared fixture (`assets/data/queue_patients.json`) describes the same
/// people that seed the queue. This seeder runs before the queue seeder so the
/// register shows real profile fields (birth date, blood type, second phone)
/// plus a consultation history and outstanding invoices.
///
/// Every step is idempotent: a patient is enriched only when its profile is
/// still empty, and history blocks are added only when the patient has none.
/// Soft-deleted demo patients are never resurrected.
class PatientDemoSeeder {
  PatientDemoSeeder({
    required this.patientDao,
    required this.consultationDao,
    required this.billingDao,
  });

  final PatientDao patientDao;
  final ConsultationDao consultationDao;
  final BillingDao billingDao;

  Future<void> seedIfEmpty() async {
    final demoPatients = QueueDemoStore.instance.patients;
    if (demoPatients.isEmpty) return;

    final now = DateTime.now();
    for (final patient in demoPatients) {
      await _seedPatient(patient, now);
    }
  }

  Future<void> _seedPatient(QueueDemoPatient patient, DateTime now) async {
    final fileNumber = patient.fileNumber ?? 'DEMO-${patient.number}';
    final existing = await patientDao.getPatientByFileNumber(fileNumber);
    if (existing?.deletedAt != null) return;

    final patientId = existing == null
        ? await patientDao.insertPatient(
            PatientDemoProfile.companion(patient, fileNumber),
          )
        : existing.id;

    if (existing != null &&
        PatientDemoProfile.needsRefresh(existing, patient)) {
      await patientDao.updatePatient(
        PatientDemoProfile.companion(patient, fileNumber, existing: existing),
      );
    }

    await PatientDemoHistory.seedConsultation(
      consultationDao,
      patientId,
      patient,
      now,
    );
    await PatientDemoHistory.seedInvoice(
      billingDao,
      patientId,
      patient,
      fileNumber,
    );
  }
}
