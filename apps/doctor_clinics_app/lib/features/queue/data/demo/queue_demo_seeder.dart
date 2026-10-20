import 'package:core/core.dart';
import 'package:drift/drift.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_patient.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_store.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';

/// Seeds the current clinic day with the offline demo patients from
/// `assets/data/queue_patients.json`.
///
/// Runs only when today has no queue entries and no appointments, so real data
/// is never overwritten and the seed is applied at most once per empty day.
/// Its purpose is to make the queue widgets render with content in the offline
/// MVP, mirroring the home dashboard mock.
class QueueDemoSeeder {
  QueueDemoSeeder({required this.patientDao, required this.queueDao});

  final PatientDao patientDao;
  final QueueDao queueDao;

  Future<void> seedIfEmpty() async {
    final now = DateTime.now();
    final entries = await queueDao.getQueueForDate(now);
    final appointments = await queueDao.getAppointmentsForDate(now);
    if (entries.isNotEmpty || appointments.isNotEmpty) return;

    final patients = QueueDemoStore.instance.patients;
    if (patients.isEmpty) return;

    for (final patient in patients) {
      await _insertPatient(patient, now);
    }
  }

  Future<void> _insertPatient(QueueDemoPatient patient, DateTime now) async {
    final fileNumber = patient.fileNumber ?? 'DEMO-${patient.number}';
    final existing = await patientDao.getPatientByFileNumber(fileNumber);
    if (existing?.deletedAt != null) return;
    final patientId =
        existing?.id ??
        await patientDao.insertPatient(
          PatientsCompanion.insert(
            fileNumber: fileNumber,
            fullName: patient.name,
            searchText: patient.name,
            gender: patient.gender ?? 'male',
            phone: Value(patient.phone),
          ),
        );

    if (patient.isBooked) {
      await queueDao.insertAppointment(
        AppointmentsCompanion.insert(
          patientId: patientId,
          scheduledDate: now,
          scheduledTime: patient.scheduledTime ?? '09:00',
          type: AppConstants.appointmentTypeBooked,
          status: AppConstants.appointmentStatusBooked,
          createdBy: 'demo',
        ),
      );
      return;
    }

    final status = QueueStatus.tryParse(patient.status) ?? QueueStatus.waiting;
    final arrivedAt = now.subtract(Duration(minutes: patient.waitMinutes ?? 0));
    await queueDao.insertQueueEntry(
      QueueEntriesCompanion.insert(
        patientId: patientId,
        queueDate: now,
        queueNumber: patient.number,
        position: patient.number,
        status: status.code,
        arrivedAt: Value(arrivedAt),
        calledAt: Value(
          status == QueueStatus.inConsultation ? arrivedAt : null,
        ),
        finishedAt: Value(status == QueueStatus.done ? now : null),
        isUrgent: Value(patient.isUrgent),
        paidAt: Value(patient.paid ? now : null),
        paidAmountPiasters: Value(patient.paidAmountPiasters),
        cancelReason: Value(patient.cancelReason),
      ),
    );
  }
}
