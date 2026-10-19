import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_action.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import '../cubit/queue_cubit.dart';
import '../widgets/queue_collect_sheet.dart';

class QueueActionDispatcher {
  QueueActionDispatcher._();

  static Future<void> dispatch(
    BuildContext context, {
    required QueueAction action,
    required QueueTicket ticket,
    required int defaultFeePiasters,
  }) async {
    final cubit = context.read<QueueCubit>();
    switch (action) {
      case QueueAction.call:
        return cubit.call(ticket.entryId);
      case QueueAction.finish:
        return cubit.finish(ticket.entryId);
      case QueueAction.cancel:
        return cubit.cancel(ticket.entryId);
      case QueueAction.restore:
        return cubit.restore(ticket.entryId);
      case QueueAction.advance:
        return cubit.advance(ticket.entryId);
      case QueueAction.toggleUrgent:
        return cubit.toggleUrgent(ticket.entryId, !ticket.isUrgent);
      case QueueAction.collect:
        final amount = await showGeneralDialog<int>(
          context: context,
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: AppColors.scrim,
          pageBuilder: (ctx, _, _) => Center(
            child: Material(
              color: AppColors.transparent,
              child: QueueCollectSheet(
                ticket: ticket,
                defaultFeePiasters: defaultFeePiasters,
              ),
            ),
          ),
        );
        if (amount != null && context.mounted) {
          return cubit.collect(ticket.entryId, amount);
        }
      case QueueAction.checkIn:
        if (ticket.appointmentId != null) {
          return cubit.checkIn(ticket.appointmentId!);
        }
    }
  }
}
