import 'package:core/core.dart';
import 'package:drift/drift.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_patient.dart';

import 'demo_patient_lookup.dart';

/// Fills the rest of the current month with demo appointments so Week and Month
/// always have content. It never touches today or a day that already has real
/// rows, and the [marker] makes the fill a one-time operation.
class DemoMonthSchedule {
  DemoMonthSchedule({required this.patientDao, required this.queueDao});

  final PatientDao patientDao;
  final QueueDao queueDao;

  static const String marker = 'demo-schedule';

  Future<void> seed(DateTime now, List<QueueDemoPatient> patients) async {
    final start = DateTime(now.year, now.month);
    final end = DateTime(now.year, now.month + 1);
    final existing = await queueDao.getAppointmentsInRange(start, end);
    if (existing.any((appointment) => appointment.createdBy == marker)) return;

    final seeded = <({QueueDemoPatient patient, int id})>[];
    for (final patient in patients) {
      final id = await DemoPatientLookup.ensure(patientDao, patient);
      if (id != null) seeded.add((patient: patient, id: id));
    }
    if (seeded.isEmpty) return;

    final today = DateTime(now.year, now.month, now.day);
    final lastDay = DateTime(now.year, now.month + 1, 0).day;
    for (var dayNumber = 1; dayNumber <= lastDay; dayNumber++) {
      final day = DateTime(now.year, now.month, dayNumber);
      if (day == today) continue;
      if ((await queueDao.getAppointmentsForDate(day)).isNotEmpty) continue;
      final count = 2 + (dayNumber % 4);
      for (var slot = 0; slot < count; slot++) {
        final entry = seeded[(dayNumber * 3 + slot) % seeded.length];
        await queueDao.insertAppointment(
          AppointmentsCompanion.insert(
            patientId: entry.id,
            scheduledDate: day,
            scheduledTime: '',
            queueNumber: Value(slot + 1),
            type: entry.patient.appointmentType,
            status: _statusFor(day, today, slot, count),
            createdBy: marker,
          ),
        );
      }
    }
  }

  /// Past days are mostly completed with a sprinkled cancellation; today and
  /// future days are still booked.
  static String _statusFor(DateTime day, DateTime today, int slot, int count) {
    if (!day.isBefore(today)) return AppConstants.appointmentStatusBooked;
    if (slot == count - 1 && day.day % 5 == 0) {
      return AppConstants.appointmentStatusCancelled;
    }
    return AppConstants.appointmentStatusDone;
  }
}
