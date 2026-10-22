import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import '../helpers/queue_row_state.dart';
import 'queue_deposit_pill.dart';
import 'queue_paid_pill.dart';

/// Deposit and cash-collected pills shown under a queue ticket's meta line.
class QueueTicketMoneyPills extends StatelessWidget {
  const QueueTicketMoneyPills({
    super.key,
    required this.ticket,
    required this.rowState,
  });

  final QueueTicket ticket;
  final QueueRowState rowState;

  @override
  Widget build(BuildContext context) {
    final deposit = ticket.depositPiasters;
    final paidNow = ticket.paidAmountPiasters ?? 0;
    final showPaid = rowState == QueueRowState.collected && paidNow > 0;
    if (deposit <= 0 && !showPaid) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
      child: Wrap(
        spacing: Dimensions.PADDING_SIZE_SMALL.w,
        runSpacing: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (deposit > 0) QueueDepositPill(depositPiasters: deposit),
          if (showPaid) QueuePaidPill(paidAmountPiasters: paidNow),
        ],
      ),
    );
  }
}
