import 'package:flutter/material.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board_row.dart';
import '../helpers/queue_board_groups.dart';
import 'queue_booked_sliver.dart';
import 'queue_empty_state.dart';
import 'queue_ticket_sliver.dart';
import 'queue_waiting_sliver.dart';

class QueueBoardView extends StatelessWidget {
  const QueueBoardView({
    super.key,
    required this.groups,
    this.onTicketTap,
    this.isSubmitting = false,
    required this.defaultFeePiasters,
  });

  final QueueBoardGroups groups;
  final ValueChanged<QueueBoardRow>? onTicketTap;
  final bool isSubmitting;
  final int defaultFeePiasters;

  @override
  Widget build(BuildContext context) {
    if (groups.isEmpty) return const QueueEmptyState();
    return CustomScrollView(
      slivers: [
        if (groups.current.isNotEmpty)
          QueueTicketSliver(
            tickets: groups.current,
            isSubmitting: isSubmitting,
            onTicketTap: onTicketTap,
            defaultFeePiasters: defaultFeePiasters,
          ),
        if (groups.urgent.isNotEmpty)
          QueueTicketSliver(
            tickets: groups.urgent,
            isSubmitting: isSubmitting,
            onTicketTap: onTicketTap,
            defaultFeePiasters: defaultFeePiasters,
          ),
        if (groups.waiting.isNotEmpty)
          QueueWaitingSliver(
            waiting: groups.waiting,
            isSubmitting: isSubmitting,
            onTicketTap: onTicketTap,
            defaultFeePiasters: defaultFeePiasters,
          ),
        if (groups.booked.isNotEmpty)
          QueueBookedSliver(
            booked: groups.booked,
            isSubmitting: isSubmitting,
            onTicketTap: onTicketTap,
          ),
        if (groups.terminal.isNotEmpty)
          QueueTicketSliver(
            tickets: groups.terminal,
            isSubmitting: isSubmitting,
            onTicketTap: onTicketTap,
            defaultFeePiasters: defaultFeePiasters,
          ),
      ],
    );
  }
}
