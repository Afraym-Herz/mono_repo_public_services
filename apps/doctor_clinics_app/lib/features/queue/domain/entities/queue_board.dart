import 'package:freezed_annotation/freezed_annotation.dart';
import 'booked_appointment.dart';
import 'queue_ticket.dart';

part 'queue_board.freezed.dart';

@freezed
class QueueBoard with _$QueueBoard {
  const factory QueueBoard({
    required List<QueueTicket> tickets,
    required List<BookedAppointment> booked,
  }) = _QueueBoard;
}
