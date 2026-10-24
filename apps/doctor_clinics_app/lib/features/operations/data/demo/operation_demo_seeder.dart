import 'package:core/core.dart';
import 'package:drift/drift.dart';

import 'package:doctor_clinics_app/core/database/app_database.dart';
import 'package:doctor_clinics_app/core/database/daos/operation_dao.dart';
import 'package:doctor_clinics_app/core/database/daos/patient_dao.dart';

/// Seeds a believable surgical week when the operations table is empty.
///
/// The board reads the local Drift tables, so without fixture rows it would
/// only ever show the empty state in the offline MVP. Real rows are never
/// touched: this runs only when no operation exists.
class OperationDemoSeeder {
  OperationDemoSeeder({required this.operationDao, required this.patientDao});

  final OperationDao operationDao;
  final PatientDao patientDao;

  Future<void> seedIfEmpty() async {
    final existing = await operationDao.getAllOperations();
    if (existing.isNotEmpty) return;

    final patients = await patientDao.getAllPatients();
    if (patients.isEmpty) return;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    for (var index = 0; index < _specs.length; index++) {
      final spec = _specs[index];
      final patient = patients[index % patients.length];
      final operationId = await operationDao.insertOperation(
        OperationsCompanion.insert(
          patientId: patient.id,
          operationType: spec.type,
          scheduledDate: today.add(Duration(days: spec.dayOffset)),
          scheduledTime: Value(spec.time),
          surgeonName: Value(spec.surgeon),
          notes: Value(spec.notes),
          status: spec.status,
          cost: spec.costPiasters,
          depositAmount: spec.depositPiasters,
        ),
      );

      for (final (testIndex, testName) in spec.tests.indexed) {
        await operationDao.insertTest(
          OperationRequiredTestsCompanion.insert(
            operationId: operationId,
            testName: testName,
            isCompleted: Value(testIndex < spec.testsDone),
          ),
        );
      }
    }
  }

  static const List<_OperationSpec> _specs = [
    _OperationSpec(
      type: 'استئصال المرارة بالمنظار',
      dayOffset: 0,
      time: '09:30',
      surgeon: 'د. يوسف عبدالله',
      status: AppConstants.operationStatusScheduled,
      costPiasters: 1800000,
      depositPiasters: 500000,
      notes:
          'صيام ٨ ساعات قبل العملية، إيقاف مضادات التجلط قبل ٥ أيام، '
          'متابعة مع طبيب التخدير مساء اليوم السابق.',
      tests: [
        'صورة دم كاملة',
        'وظائف كبد',
        'وظائف كلى',
        'أشعة سينية للصدر',
        'رسم قلب',
      ],
      testsDone: 3,
    ),
    _OperationSpec(
      type: 'تنظير القولون',
      dayOffset: 0,
      time: '11:00',
      surgeon: 'د. يوسف عبدالله',
      status: AppConstants.operationStatusScheduled,
      costPiasters: 900000,
      depositPiasters: 300000,
      notes: 'تحضير الأمعاء حسب تعليمات التمريض، مراجعة الأدوية الحالية.',
      tests: ['صورة دم كاملة', 'وظائف كلى', 'تحليل تخثر الدم'],
      testsDone: 1,
    ),
    _OperationSpec(
      type: 'إصلاح فتق إربي',
      dayOffset: 0,
      time: '14:00',
      surgeon: 'د. يوسف عبدالله',
      status: AppConstants.operationStatusCompleted,
      costPiasters: 1200000,
      depositPiasters: 1200000,
      notes: 'تمت العملية بنجاح، تعليمات المتابعة بعد ٧ أيام بالعيادة.',
      tests: ['صورة دم كاملة', 'وظائف كلى', 'رسم قلب'],
      testsDone: 3,
    ),
    _OperationSpec(
      type: 'استئصال الزائدة الدودية',
      dayOffset: 1,
      time: '10:00',
      surgeon: '',
      status: AppConstants.operationStatusScheduled,
      costPiasters: 1500000,
      depositPiasters: 0,
      notes: 'حالة عاجلة، يرجى تثبيت الجراح والفريق المساعد قبل الموعد.',
      tests: ['صورة دم كاملة', 'أشعة مقطعية', 'وظائف كلى', 'تحليل تخثر الدم'],
      testsDone: 0,
    ),
    _OperationSpec(
      type: 'تنظير المعدة',
      dayOffset: 2,
      time: '12:30',
      surgeon: 'د. يوسف عبدالله',
      status: AppConstants.operationStatusScheduled,
      costPiasters: 800000,
      depositPiasters: 200000,
      notes: 'صيام ٦ ساعات، إبلاغ المريضة بضرورة اصطحاب مرافق.',
      tests: ['صورة دم كاملة', 'وظائف كبد'],
      testsDone: 1,
    ),
    _OperationSpec(
      type: 'إصلاح غضروف الركبة',
      dayOffset: -1,
      time: '16:00',
      surgeon: 'د. يوسف عبدالله',
      status: AppConstants.operationStatusCancelled,
      costPiasters: 2000000,
      depositPiasters: 0,
      notes: 'ألغيت العملية بطلب المريض لأسباب شخصية.',
      tests: ['صورة دم كاملة', 'وظائف كلى', 'أشعة رنين مغناطيسي'],
      testsDone: 0,
    ),
  ];
}

class _OperationSpec {
  const _OperationSpec({
    required this.type,
    required this.dayOffset,
    required this.time,
    required this.surgeon,
    required this.status,
    required this.costPiasters,
    required this.depositPiasters,
    required this.notes,
    required this.tests,
    required this.testsDone,
  });

  final String type;
  final int dayOffset;
  final String time;
  final String surgeon;
  final String status;
  final int costPiasters;
  final int depositPiasters;
  final String notes;
  final List<String> tests;
  final int testsDone;
}
