import 'package:core/core.dart';

/// One fixture row for [OperationDemoSeeder].
class OperationDemoSpec {
  const OperationDemoSpec({
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

/// A believable surgical week centred on today.
const List<OperationDemoSpec> operationDemoSpecs = [
  OperationDemoSpec(
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
  OperationDemoSpec(
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
  OperationDemoSpec(
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
  OperationDemoSpec(
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
  OperationDemoSpec(
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
  OperationDemoSpec(
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
