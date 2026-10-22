import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board_row.dart';
import '../cubit/queue_cubit.dart';
import '../helpers/queue_board_groups.dart';
import 'queue_empty_state.dart';
import 'queue_ticket_sliver.dart';
import 'queue_waiting_sliver.dart';

class QueueBoardView extends StatelessWidget {
  const QueueBoardView({
    super.key,
    required this.groups,
    this.onTicketTap,
    this.isSubmitting = false,
  });

  final QueueBoardGroups groups;
  final ValueChanged<QueueBoardRow>? onTicketTap;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    if (groups.isEmpty) return const QueueEmptyState();
    final cubit = context.read<QueueCubit>();
    return CustomScrollView(
      slivers: [
        if (groups.current.isNotEmpty)
          QueueTicketSliver(
            tickets: groups.current,
            isSubmitting: isSubmitting,
            onTicketTap: onTicketTap,
          ),
        if (groups.urgent.isNotEmpty)
          QueueTicketSliver(
            tickets: groups.urgent,
            isSubmitting: isSubmitting,
            onTicketTap: onTicketTap,
            onToggleUrgent: cubit.canManageQueue
                ? (ticket) =>
                      cubit.toggleUrgent(ticket.entryId, !ticket.isUrgent)
                : null,
          ),
        if (groups.waiting.isNotEmpty)
          QueueWaitingSliver(
            waiting: groups.waiting,
            isSubmitting: isSubmitting,
            onTicketTap: onTicketTap,
          ),
        if (groups.terminal.isNotEmpty)
          QueueTicketSliver(
            tickets: groups.terminal,
            isSubmitting: isSubmitting,
            onTicketTap: onTicketTap,
          ),
      ],
    );
  }
}
