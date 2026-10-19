import 'package:doctor_clinics_app/features/queue/domain/entities/booked_appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';

/// Waiting-health rating surfaced on the summary strip.
enum QueueWaitRating {
  excellent(labelKey: 'queue_summary.rate_excellent'),
  good(labelKey: 'queue_summary.rate_good'),
  high(labelKey: 'queue_summary.rate_high');

  const QueueWaitRating({required this.labelKey});

  final String labelKey;
}

/// Aggregates today's board into the figures shown above the queue list.
class QueueSummaryData {
  const QueueSummaryData({
    required this.waiting,
    required this.done,
    required this.cancelled,
    required this.noShow,
    required this.totalRegistered,
    required this.averageWaitMinutes,
    this.current,
  });

  final int waiting;
  final int done;
  final int cancelled;
  final int noShow;
  final int totalRegistered;
  final int averageWaitMinutes;
  final QueueTicket? current;

  factory QueueSummaryData.fromBoard({
    required List<QueueTicket> tickets,
    required List<BookedAppointment> booked,
    DateTime? now,
  }) {
    final at = now ?? DateTime.now();
    final waitingTickets = tickets
        .where((ticket) => ticket.status == QueueStatus.waiting)
        .toList();
    final waitTimes = waitingTickets
        .map((ticket) => at.difference(ticket.arrivedAt).inMinutes)
        .where((minutes) => minutes > 0)
        .toList();
    final average = waitTimes.isEmpty
        ? 0
        : waitTimes.reduce((a, b) => a + b) ~/ waitTimes.length;

    return QueueSummaryData(
      waiting: waitingTickets.length,
      done: tickets.where((t) => t.status == QueueStatus.done).length,
      cancelled: tickets.where((t) => t.status == QueueStatus.cancelled).length,
      // Queue entries do not record a no-show status yet, so it stays at zero.
      noShow: 0,
      totalRegistered: tickets.length + booked.length,
      averageWaitMinutes: average,
      current: _currentOf(tickets),
    );
  }

  QueueWaitRating get rating {
    if (averageWaitMinutes <= 15) return QueueWaitRating.excellent;
    if (averageWaitMinutes <= 30) return QueueWaitRating.good;
    return QueueWaitRating.high;
  }

  static QueueTicket? _currentOf(List<QueueTicket> tickets) {
    for (final ticket in tickets) {
      if (ticket.status == QueueStatus.inConsultation) return ticket;
    }
    return null;
  }
}
