import 'package:freezed_annotation/freezed_annotation.dart';
import 'queue_status.dart';

part 'queue_ticket.freezed.dart';

@freezed
class QueueTicket with _$QueueTicket {
  const QueueTicket._();

  const factory QueueTicket({
    required int entryId,
    int? appointmentId,
    required int patientId,
    required int queueNumber,
    required int position,
    required QueueStatus status,
    required bool isUrgent,
    required DateTime arrivedAt,
    DateTime? calledAt,
    DateTime? finishedAt,
    required String patientName,
    String? patientPhone,
    String? fileNumber,
    String? appointmentType,
    String? scheduledTime,
    @Default(0) int depositPiasters,
    DateTime? paidAt,
    int? paidAmountPiasters,
    String? cancelReason,
  }) = _QueueTicket;

  bool get isPaid => paidAt != null;
}
