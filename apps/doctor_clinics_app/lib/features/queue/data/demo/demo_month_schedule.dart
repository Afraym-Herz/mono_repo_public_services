import 'package:core/core.dart';
import 'package:drift/drift.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_patient.dart';

import 'demo_patient_lookup.dart';
import 'demo_today_seed.dart';

/// Fills the rest of the current month with demo appointments so Week and Month
/// always have content. It never touches today or a day that already has real
/// rows, and the [marker] makes the fill a one-time operation.
class DemoMonthSchedule {
  DemoMonthSchedule({required this.patientDao, required this.queueDao});

  final PatientDao patientDao;
  final QueueDao queueDao;

  static const String marker = 'demo-schedule-v2';

  Future<void> seed(DateTime now, List<QueueDemoPatient> patients) async {
    final start = DateTime(now.year, now.month);
    final end = DateTime(now.year, now.month + 1);
    final existing = await queueDao.getAppointmentsInRange(start, end);
    if (existing.any((appointment) => appointment.createdBy == marker)) return;
    // A month that already contains a real (non-demo) booking belongs to the
    // clinic — never sprinkle fixture rows around it.
    if (existing.any(
      (appointment) =>
          appointment.createdBy != DemoTodaySeed.marker &&
          appointment.createdBy != marker,
    )) {
      return;
    }

    final seeded = <({QueueDemoPatient patient, int id})>[];
    for (final patient in patients) {
      final id = await DemoPatientLookup.ensure(patientDao, patient);
      if (id != null) seeded.add((patient: patient, id: id));
    }
    if (seeded.isEmpty) return;

    final today = DateTime(now.year, now.month, now.day);
    final lastDay = DateTime(now.year, now.month + 1, 0).day;
    final bookedOnly = seeded
        .where(
          (entry) =>
              entry.patient.appointmentType !=
              AppConstants.appointmentTypeWalkIn,
        )
        .toList(growable: false);
    final walkIns = seeded
        .where(
          (entry) =>
              entry.patient.appointmentType ==
              AppConstants.appointmentTypeWalkIn,
        )
        .toList(growable: false);
    if (bookedOnly.isEmpty) return;

    for (var dayNumber = 1; dayNumber <= lastDay; dayNumber++) {
      final day = DateTime(now.year, now.month, dayNumber);
      if (day == today) continue;
      if ((await queueDao.getAppointmentsForDate(day)).isNotEmpty) continue;
      // Future days only hold pre-booked visits. On past days walk-ins may
      // appear too, but always after the pre-booked tickets.
      final pool = day.isBefore(today)
          ? [...bookedOnly, ...walkIns]
          : bookedOnly;
      final requested = 2 + (dayNumber % 4);
      final count = requested < pool.length ? requested : pool.length;
      for (var slot = 0; slot < count; slot++) {
        final entry = pool[(dayNumber * 3 + slot) % pool.length];
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
