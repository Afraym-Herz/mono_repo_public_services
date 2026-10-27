import '../../domain/entities/queue_status.dart';
import '../../domain/entities/queue_ticket.dart';

/// The patient the desk should invite into the examination room next.
///
/// Urgent tickets jump the line; otherwise the lowest queue position wins.
QueueTicket? nextWaitingTicket(List<QueueTicket> tickets) {
  final waiting = tickets
      .where((ticket) => ticket.status == QueueStatus.waiting)
      .toList();
  if (waiting.isEmpty) return null;
  waiting.sort((a, b) {
    if (a.isUrgent != b.isUrgent) return a.isUrgent ? -1 : 1;
    return a.position.compareTo(b.position);
  });
  return waiting.first;
}
