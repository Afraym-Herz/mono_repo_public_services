import 'home_queue_action.dart';
import 'home_queue_status.dart';

/// One row in the home "current queue" panel.
///
/// Presentational: mirrors the design mock until the panel reads the live queue
/// feed.
class HomeQueueSampleRow {
  const HomeQueueSampleRow({
    required this.number,
    required this.name,
    required this.status,
    required this.examTypeKey,
    required this.action,
    this.waitMinutes,
    this.appointmentTime,
  });

  /// Ticket number shown in the leading badge.
  final int number;

  /// Patient display name.
  final String name;

  /// Status shown in the chip.
  final HomeQueueStatus status;

  /// `.tr()` key for the exam/visit type.
  final String examTypeKey;

  /// Quick action offered on the row.
  final HomeQueueAction action;

  /// Minutes waiting, for arrived patients.
  final int? waitMinutes;

  /// Confirmed slot (`١٠:٣٠ م`) for booked patients.
  final String? appointmentTime;
}

/// Sample rows mirroring the dashboard mock (DESIGN (2).md).
const List<HomeQueueSampleRow> homeQueueSampleRows = [
  HomeQueueSampleRow(
    number: 1,
    name: 'أحمد محمود علي',
    status: HomeQueueStatus.inConsultation,
    examTypeKey: 'home_queue_exam_general',
    waitMinutes: 18,
    action: HomeQueueAction.finish,
  ),
  HomeQueueSampleRow(
    number: 2,
    name: 'فاطمة حسن إبراهيم',
    status: HomeQueueStatus.waiting,
    examTypeKey: 'home_queue_exam_new',
    waitMinutes: 22,
    action: HomeQueueAction.call,
  ),
  HomeQueueSampleRow(
    number: 3,
    name: 'عاصم كمال الشريف',
    status: HomeQueueStatus.urgent,
    examTypeKey: 'home_queue_exam_referral',
    waitMinutes: 8,
    action: HomeQueueAction.start,
  ),
  HomeQueueSampleRow(
    number: 4,
    name: 'مريم وجدي النجار',
    status: HomeQueueStatus.waiting,
    examTypeKey: 'home_queue_exam_new',
    waitMinutes: 12,
    action: HomeQueueAction.more,
  ),
  HomeQueueSampleRow(
    number: 5,
    name: 'طارق سمير عبد الحليم',
    status: HomeQueueStatus.booked,
    examTypeKey: 'home_queue_exam_general',
    appointmentTime: '١٠:٣٠ م',
    action: HomeQueueAction.checkIn,
  ),
];
