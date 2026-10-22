import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';

import '../helpers/queue_row_state.dart';
import '../helpers/queue_ticket_details.dart';
import 'queue_status_badge.dart';
import 'queue_ticket_meta.dart';
import 'queue_ticket_money_pills.dart';

/// Identity block on a queue card: name + status chip, the extra contact/file
/// line, and the home-style type/timing meta line.
class QueueTicketBody extends StatelessWidget {
  const QueueTicketBody({super.key, required this.ticket});

  final QueueTicket ticket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rowState = ticket.rowState;
    final extra = QueueTicketDetails.extraInfo(context, ticket);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                ticket.patientName,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.clinicTextPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            QueueStatusBadge(rowState: rowState),
          ],
        ),
        if (extra != null) ...[
          SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
          Text(
            extra,
            style: theme.textTheme.bodySmall?.copyWith(
              color: context.clinicTextSecondary,
              fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL.sp,
            ),
          ),
        ],
        SizedBox(height: Dimensions.PADDING_SIZE_MEDIUM_BORDER.h),
        QueueTicketMeta(
          appointmentType: ticket.appointmentType,
          detail: QueueTicketDetails.timing(context, ticket),
        ),
        QueueTicketMoneyPills(ticket: ticket, rowState: rowState),
      ],
    );
  }
}
