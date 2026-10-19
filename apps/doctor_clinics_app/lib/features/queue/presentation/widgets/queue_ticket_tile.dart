import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_action.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import '../helpers/queue_row_state.dart';
import 'queue_ticket_actions.dart';
import 'queue_ticket_body.dart';
import 'queue_ticket_number_badge.dart';
import 'queue_ticket_surface.dart';

class QueueTicketTile extends StatelessWidget {
  const QueueTicketTile({
    super.key,
    required this.ticket,
    this.onTap,
    required this.onAction,
    this.onToggleUrgent,
    this.isSubmitting = false,
  });

  final QueueTicket ticket;
  final VoidCallback? onTap;
  final ValueChanged<QueueAction> onAction;
  final VoidCallback? onToggleUrgent;
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    final state = ticket.rowState;
    final canToggleUrgent = ticket.status == QueueStatus.waiting;
    return QueueTicketSurface(
      rowState: state,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QueueTicketNumberBadge(
            number: ticket.queueNumber,
            rowState: state,
            isUrgent: ticket.isUrgent,
          ),
          SizedBox(width: Dimensions.paddingSizeDefault.w),
          Expanded(
            child: QueueTicketBody(ticket: ticket),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          QueueTicketActions(
            rowState: state,
            onAction: onAction,
            isSubmitting: isSubmitting,
            isUrgent: ticket.isUrgent,
            onToggleUrgent: canToggleUrgent ? onToggleUrgent : null,
          ),
        ],
      ),
    );
  }
}
