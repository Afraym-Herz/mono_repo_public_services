import 'package:doctor_clinics_app/features/queue/domain/entities/booked_appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import 'queue_list_filter.dart';
import 'queue_sort_order.dart';

class QueueBoardGroups {
  final List<QueueTicket> current;
  final List<QueueTicket> urgent;
  final List<QueueTicket> waiting;
  final List<BookedAppointment> booked;
  final List<QueueTicket> terminal;

  const QueueBoardGroups({
    required this.current,
    required this.urgent,
    required this.waiting,
    required this.booked,
    required this.terminal,
  });

  bool get isEmpty =>
      current.isEmpty &&
      urgent.isEmpty &&
      waiting.isEmpty &&
      booked.isEmpty &&
      terminal.isEmpty;

  static QueueBoardGroups build({
    required List<QueueTicket> tickets,
    required List<BookedAppointment> booked,
    required QueueListFilter filter,
    required QueueSortOrder sortOrder,
  }) {
    final cur = tickets
        .where((t) => t.status == QueueStatus.inConsultation)
        .toList()
      ..sort((a, b) => a.position.compareTo(b.position));
    final urg = tickets
        .where((t) => t.status == QueueStatus.waiting && t.isUrgent)
        .toList()
      ..sort((a, b) => a.position.compareTo(b.position));
    final wai = tickets
        .where((t) => t.status == QueueStatus.waiting && !t.isUrgent)
        .toList()
      ..sort((a, b) {
        final cmp = a.position.compareTo(b.position);
        return sortOrder == QueueSortOrder.ticketDescending ? -cmp : cmp;
      });
    final bk = [...booked]..sort(
        (a, b) => a.scheduledTime.compareTo(b.scheduledTime),
      );
    final term = tickets.where((t) => t.status.isTerminal).toList()
      ..sort((a, b) {
        final cmp = a.position.compareTo(b.position);
        return sortOrder == QueueSortOrder.ticketDescending ? -cmp : cmp;
      });

    switch (filter) {
      case QueueListFilter.all:
        return QueueBoardGroups(
          current: cur,
          urgent: urg,
          waiting: wai,
          booked: bk,
          terminal: term,
        );
      case QueueListFilter.waiting:
        return QueueBoardGroups(
          current: const [],
          urgent: urg,
          waiting: wai,
          booked: bk,
          terminal: const [],
        );
      case QueueListFilter.inConsultation:
        return QueueBoardGroups(
          current: cur,
          urgent: const [],
          waiting: const [],
          booked: const [],
          terminal: const [],
        );
      case QueueListFilter.done:
        return QueueBoardGroups(
          current: const [],
          urgent: const [],
          waiting: const [],
          booked: const [],
          terminal: term.where((t) => t.status == QueueStatus.done).toList(),
        );
      case QueueListFilter.cancelled:
        return QueueBoardGroups(
          current: const [],
          urgent: const [],
          waiting: const [],
          booked: const [],
          terminal:
              term.where((t) => t.status == QueueStatus.cancelled).toList(),
        );
    }
  }
}
