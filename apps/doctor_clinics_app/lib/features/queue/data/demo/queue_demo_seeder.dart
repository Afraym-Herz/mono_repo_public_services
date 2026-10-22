import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/queue_dao.dart';
import 'package:doctor_clinics_app/core/demo/queue_demo_store.dart';

import 'demo_month_schedule.dart';
import 'demo_today_seed.dart';

/// Seeds the offline demo clinic from `assets/data/queue_patients.json`.
///
/// Today is seeded only when it is completely empty, preserving the original
/// "never overwrite a real day" rule. The remaining days of the current month
/// are filled once by [DemoMonthSchedule] so the Week and Month planner views
/// render with content instead of empty cells.
class QueueDemoSeeder {
  QueueDemoSeeder({required this.patientDao, required this.queueDao});

  final PatientDao patientDao;
  final QueueDao queueDao;

  /// Markers used by older demo fixtures. They are removed once so corrected
  /// fixture data (ticket order, deposits) is seeded even on a device that
  /// already ran an older demo.
  static const Set<String> _legacyMarkers = {
    'demo',
    'demo-schedule',
    'demo-v2',
    'demo-schedule-v2',
  };

  Future<void> seedIfEmpty() async {
    final now = DateTime.now();
    final patients = QueueDemoStore.instance.patients;
    if (patients.isEmpty) return;
    await queueDao.deleteDemoAppointments(_legacyMarkers);
    final entries = await queueDao.getQueueForDate(now);
    final appointments = await queueDao.getAppointmentsForDate(now);
    if (entries.isEmpty && appointments.isEmpty) {
      await DemoTodaySeed(
        patientDao: patientDao,
        queueDao: queueDao,
      ).seed(now, patients);
    }
    await DemoMonthSchedule(
      patientDao: patientDao,
      queueDao: queueDao,
    ).seed(now, patients);
  }
}
