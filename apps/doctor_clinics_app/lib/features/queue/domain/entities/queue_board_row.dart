import 'package:freezed_annotation/freezed_annotation.dart';
import 'queue_ticket.dart';

part 'queue_board_row.freezed.dart';

@freezed
sealed class QueueBoardRow with _$QueueBoardRow {
  const factory QueueBoardRow.ticket(QueueTicket ticket) = QueueTicketRow;
}
