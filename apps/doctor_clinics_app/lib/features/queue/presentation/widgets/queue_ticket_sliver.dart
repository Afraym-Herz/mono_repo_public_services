import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board_row.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import '../helpers/queue_action_dispatcher.dart';
import 'queue_ticket_tile.dart';

class QueueTicketSliver extends StatelessWidget {
  const QueueTicketSliver({
    super.key,
    required this.tickets,
    this.onTicketTap,
    this.isSubmitting = false,
    this.onToggleUrgent,
  });

  final List<QueueTicket> tickets;
  final ValueChanged<QueueBoardRow>? onTicketTap;
  final bool isSubmitting;
  final ValueChanged<QueueTicket>? onToggleUrgent;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final ticket = tickets[index];
        return Padding(
          padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL.h),
          child: QueueTicketTile(
            ticket: ticket,
            isSubmitting: isSubmitting,
            onTap: () => onTicketTap?.call(QueueBoardRow.ticket(ticket)),
            onAction: (a) => QueueActionDispatcher.dispatch(
              context,
              action: a,
              ticket: ticket,
            ),
            onToggleUrgent: onToggleUrgent == null
                ? null
                : () => onToggleUrgent!(ticket),
          ),
        );
      }, childCount: tickets.length),
    );
  }
}
