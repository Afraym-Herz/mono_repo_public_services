import 'package:freezed_annotation/freezed_annotation.dart';
import 'queue_ticket.dart';

part 'queue_board.freezed.dart';

@freezed
class QueueBoard with _$QueueBoard {
  const factory QueueBoard({required List<QueueTicket> tickets}) = _QueueBoard;
}
