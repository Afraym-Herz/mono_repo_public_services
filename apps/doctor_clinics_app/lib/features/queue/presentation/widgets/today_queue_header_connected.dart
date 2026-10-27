import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/queue_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/queue_next_ticket.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/queue_screen_call.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/schedule_permissions.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_booking_dialog.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/today_queue_header.dart';

/// [TodayQueueHeader] bound to [QueueCubit].
///
/// Both quick actions stay mounted while the board reloads and are only
/// disabled, so the banner does not reflow on every row action.
class TodayQueueHeaderConnected extends StatelessWidget {
  const TodayQueueHeaderConnected({super.key});

  @override
  Widget build(BuildContext context) {
    final canManage = canManageSchedule();
    return BlocBuilder<QueueCubit, QueueState>(
      builder: (context, state) {
        final loaded = state.maybeMap(loaded: (s) => s, orElse: () => null);
        final busy = loaded == null || loaded.isSubmitting;
        final roomFree =
            loaded != null &&
            !loaded.tickets.any(
              (ticket) => ticket.status == QueueStatus.inConsultation,
            );
        return TodayQueueHeader(
          onAddWalkIn: canManage && loaded != null
              ? () => _addWalkIn(context)
              : null,
          onScreenCall: () => callNextPatientToScreen(context),
          isAddWalkInEnabled: !busy,
          isScreenCallEnabled:
              loaded != null &&
              !loaded.isSubmitting &&
              roomFree &&
              nextWaitingTicket(loaded.tickets) != null,
        );
      },
    );
  }

  Future<void> _addWalkIn(BuildContext context) async {
    final draft = await showAppointmentBookingDialog(
      context,
      initialDate: DateTime.now(),
      isWalkIn: true,
    );
    if (draft == null || !context.mounted) return;
    await context.read<QueueCubit>().addWalkIn(
      draft.patientId,
      notes: draft.notes,
      depositPiasters: draft.depositPiasters,
    );
  }
}
