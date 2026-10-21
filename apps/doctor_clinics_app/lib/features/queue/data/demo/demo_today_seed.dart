import 'package:core/core.dart';
import 'package:drift/drift.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_patient.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';

import 'demo_patient_lookup.dart';

/// Seeds today's queue and one appointment row per demo patient.
///
/// Runs only when today is completely empty, so a real clinic day is never
/// touched. Appointment status mirrors the queue status the fixture describes,
/// which is what makes the Day view show a full, believable mix.
class DemoTodaySeed {
  DemoTodaySeed({required this.patientDao, required this.queueDao});

  final PatientDao patientDao;
  final QueueDao queueDao;

  Future<void> seed(DateTime now, List<QueueDemoPatient> patients) async {
    final day = DateTime(now.year, now.month, now.day);
    for (final patient in patients) {
      final patientId = await DemoPatientLookup.ensure(patientDao, patient);
      if (patientId == null) continue;
      final appointmentId = await queueDao.insertAppointment(
        AppointmentsCompanion.insert(
          patientId: patientId,
          scheduledDate: day,
          scheduledTime: '',
          queueNumber: Value(patient.number),
          type: patient.appointmentType,
          status: _appointmentStatus(patient.status),
          createdBy: 'demo',
        ),
      );
      final status =
          QueueStatus.tryParse(patient.status) ?? QueueStatus.waiting;
      final arrivedAt = now.subtract(
        Duration(minutes: patient.waitMinutes ?? 0),
      );
      await queueDao.insertQueueEntry(
        QueueEntriesCompanion.insert(
          appointmentId: Value(appointmentId),
          patientId: patientId,
          queueDate: day,
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

  /// Queue statuses outside this map (notably "booked"/"waiting") stay booked on
  /// the appointment row.
  static String _appointmentStatus(String queueStatus) => switch (queueStatus) {
    AppConstants.appointmentStatusInConsultation =>
      AppConstants.appointmentStatusInConsultation,
    AppConstants.appointmentStatusDone => AppConstants.appointmentStatusDone,
    AppConstants.appointmentStatusCancelled =>
      AppConstants.appointmentStatusCancelled,
    AppConstants.appointmentStatusNoShow =>
      AppConstants.appointmentStatusNoShow,
    _ => AppConstants.appointmentStatusBooked,
  };
}
