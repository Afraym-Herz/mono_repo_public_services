import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'queue_demo_patient.freezed.dart';
part 'queue_demo_patient.g.dart';

/// One patient in the offline demo clinic day, parsed from
/// `assets/data/queue_patients.json`.
///
/// App-level fixture (not a feature model): the same rows feed the home
/// "current queue" panel, seed the full queue workspace, and seed the patient
/// register in the offline MVP. Feature-specific defaults (exam-type `.tr()`
/// key, row action) stay null and are applied by the consuming feature.
///
/// The profile block (`birthDate`, `bloodType`, `phone2`) and the register block
/// (`lastVisitDaysAgo`, `followUpInDays`, `debtPiasters`) are only read by
/// [PatientDemoSeeder]; the queue rows ignore them. `depositPiasters` is present
/// only on the demo bookings that paid a deposit upfront.
@freezed
class QueueDemoPatient with _$QueueDemoPatient {
  const QueueDemoPatient._();

  const factory QueueDemoPatient({
    required int number,
    required String name,
    required String status,
    required String appointmentType,
    required bool isUrgent,
    required bool showOnHome,
    required bool paid,
    String? phone,
    String? fileNumber,
    String? gender,
    String? examTypeKey,
    String? homeAction,
    int? waitMinutes,
    String? scheduledTime,
    int? paidAmountPiasters,
    int? depositPiasters,
    String? cancelReason,
    String? birthDate,
    String? phone2,
    String? bloodType,
    int? lastVisitDaysAgo,
    int? followUpInDays,
    int? debtPiasters,
  }) = _QueueDemoPatient;

  /// True for an appointment that has not checked in yet.
  bool get isBooked => status == AppConstants.appointmentStatusBooked;

  factory QueueDemoPatient.fromJson(Map<String, dynamic> json) =>
      _$QueueDemoPatientFromJson(json);
}
