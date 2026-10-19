import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board_row.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import '../cubit/queue_cubit.dart';
import '../helpers/queue_action_dispatcher.dart';
import 'queue_ticket_tile.dart';

class QueueWaitingSliver extends StatelessWidget {
  const QueueWaitingSliver({
    super.key,
    required this.waiting,
    this.onTicketTap,
    this.isSubmitting = false,
    required this.defaultFeePiasters,
  });

  final List<QueueTicket> waiting;
  final ValueChanged<QueueBoardRow>? onTicketTap;
  final bool isSubmitting;
  final int defaultFeePiasters;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QueueCubit>();
    return SliverReorderableList(
      itemCount: waiting.length,
      onReorderItem: cubit.reorderWaiting,
      itemBuilder: (context, index) {
        final ticket = waiting[index];
        return ReorderableDelayedDragStartListener(
          key: ValueKey(ticket.entryId),
          index: index,
          child: Padding(
            padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL.h),
            child: QueueTicketTile(
              ticket: ticket,
              isSubmitting: isSubmitting,
              onTap: () => onTicketTap?.call(QueueBoardRow.ticket(ticket)),
              onAction: (a) => QueueActionDispatcher.dispatch(
                context,
                action: a,
                ticket: ticket,
                defaultFeePiasters: defaultFeePiasters,
              ),
              onToggleUrgent: () =>
                  cubit.toggleUrgent(ticket.entryId, !ticket.isUrgent),
            ),
          ),
        );
      },
    );
  }
}
