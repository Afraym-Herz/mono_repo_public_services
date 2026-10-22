import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_action.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import '../cubit/queue_cubit.dart';
import '../widgets/queue_payment_sheet.dart';

class QueueActionDispatcher {
  QueueActionDispatcher._();

  static Future<void> dispatch(
    BuildContext context, {
    required QueueAction action,
    required QueueTicket ticket,
  }) async {
    final cubit = context.read<QueueCubit>();
    switch (action) {
      case QueueAction.call:
        return cubit.call(ticket.entryId);
      case QueueAction.finish:
        // The secretary records the cash collected at the end of the visit.
        // Doctors keep the plain finish; the secretary can collect afterwards.
        if (!cubit.canManageQueue) return cubit.finish(ticket.entryId);
        final amount = await _showPaymentSheet(
          context,
          ticket: ticket,
          isFinish: true,
        );
        if (amount != null && context.mounted) {
          return cubit.finishAndCollect(ticket.entryId, amount);
        }
        return;
      case QueueAction.cancel:
        return cubit.cancel(ticket.entryId);
      case QueueAction.restore:
        return cubit.restore(ticket.entryId);
      case QueueAction.advance:
        return cubit.advance(ticket.entryId);
      case QueueAction.toggleUrgent:
        return cubit.toggleUrgent(ticket.entryId, !ticket.isUrgent);
      case QueueAction.collect:
        final amount = await _showPaymentSheet(context, ticket: ticket);
        if (amount != null && context.mounted) {
          return cubit.collect(ticket.entryId, amount);
        }
        return;
      case QueueAction.markNoShow:
        return cubit.markNoShow(ticket.entryId);
    }
  }

  static Future<int?> _showPaymentSheet(
    BuildContext context, {
    required QueueTicket ticket,
    bool isFinish = false,
  }) {
    return showGeneralDialog<int>(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: AppColors.scrim,
      pageBuilder: (ctx, _, _) => Center(
        child: Material(
          color: AppColors.transparent,
          child: QueuePaymentSheet(ticket: ticket, isFinish: isFinish),
        ),
      ),
    );
  }
}
