import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_list_item.freezed.dart';

/// One appointment row in the Day/Week planner, already enriched with the
/// patient fields the list needs.
@freezed
class AppointmentListItem with _$AppointmentListItem {
  const factory AppointmentListItem({
    required int appointmentId,
    required int patientId,
    required String patientName,
    String? patientPhone,
    String? fileNumber,
    required DateTime scheduledDate,
    int? queueNumber,
    required String type,
    required String status,
    String? notes,
  }) = _AppointmentListItem;

  const AppointmentListItem._();

  bool get isCancelled => status == AppConstants.appointmentStatusCancelled;
  bool get isNoShow => status == AppConstants.appointmentStatusNoShow;
  bool get isDone => status == AppConstants.appointmentStatusDone;
  bool get isInConsultation =>
      status == AppConstants.appointmentStatusInConsultation;
  bool get isBooked => status == AppConstants.appointmentStatusBooked;
  bool get isInactive => isCancelled || isNoShow || isDone;
}
