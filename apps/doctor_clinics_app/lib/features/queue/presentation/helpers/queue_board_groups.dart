import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import 'queue_list_filter.dart';
import 'queue_sort_order.dart';

class QueueBoardGroups {
  final List<QueueTicket> current;
  final List<QueueTicket> urgent;
  final List<QueueTicket> waiting;
  final List<QueueTicket> terminal;

  const QueueBoardGroups({
    required this.current,
    required this.urgent,
    required this.waiting,
    required this.terminal,
  });

  bool get isEmpty =>
      current.isEmpty && urgent.isEmpty && waiting.isEmpty && terminal.isEmpty;

  static QueueBoardGroups build({
    required List<QueueTicket> tickets,
    required QueueListFilter filter,
    required QueueSortOrder sortOrder,
  }) {
    final current =
        tickets.where((t) => t.status == QueueStatus.inConsultation).toList()
          ..sort((a, b) => a.position.compareTo(b.position));
    final urgent =
        tickets
            .where((t) => t.status == QueueStatus.waiting && t.isUrgent)
            .toList()
          ..sort((a, b) => a.position.compareTo(b.position));
    final waiting =
        tickets
            .where((t) => t.status == QueueStatus.waiting && !t.isUrgent)
            .toList()
          ..sort((a, b) {
            final cmp = a.position.compareTo(b.position);
            return sortOrder == QueueSortOrder.ticketDescending ? -cmp : cmp;
          });
    final terminal = tickets.where((t) => t.status.isTerminal).toList()
      ..sort((a, b) {
        final cmp = a.position.compareTo(b.position);
        return sortOrder == QueueSortOrder.ticketDescending ? -cmp : cmp;
      });

    switch (filter) {
      case QueueListFilter.all:
        return QueueBoardGroups(
          current: current,
          urgent: urgent,
          waiting: waiting,
          terminal: terminal,
        );
      case QueueListFilter.waiting:
        return QueueBoardGroups(
          current: const [],
          urgent: urgent,
          waiting: waiting,
          terminal: const [],
        );
      case QueueListFilter.inConsultation:
        return QueueBoardGroups(
          current: current,
          urgent: const [],
          waiting: const [],
          terminal: const [],
        );
      case QueueListFilter.done:
        return QueueBoardGroups(
          current: const [],
          urgent: const [],
          waiting: const [],
          terminal: terminal
              .where((t) => t.status == QueueStatus.done)
              .toList(),
        );
      case QueueListFilter.noShow:
        return QueueBoardGroups(
          current: const [],
          urgent: const [],
          waiting: const [],
          terminal: terminal
              .where((t) => t.status == QueueStatus.noShow)
              .toList(),
        );
      case QueueListFilter.cancelled:
        return QueueBoardGroups(
          current: const [],
          urgent: const [],
          waiting: const [],
          terminal: terminal
              .where((t) => t.status == QueueStatus.cancelled)
              .toList(),
        );
    }
  }
}
