import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/queue_status.dart';
import '../cubit/queue_cubit.dart';
import '../widgets/queue_call_announcement_dialog.dart';
import 'queue_doctor_name.dart';
import 'queue_next_ticket.dart';

/// Calls the next waiting ticket and announces it on the waiting-room card.
///
/// The queue allows one patient in consultation at a time, so the header action
/// is only enabled when the room is free (see `QueueBody`).
Future<void> callNextPatientToScreen(BuildContext context) async {
  final cubit = context.read<QueueCubit>();
  final loaded = cubit.state.maybeMap(loaded: (s) => s, orElse: () => null);
  if (loaded == null || loaded.isSubmitting) return;

  final next = nextWaitingTicket(loaded.tickets);
  if (next == null) return;

  await cubit.call(next.entryId);
  if (!context.mounted || cubit.isClosed) return;

  final state = cubit.state;
  final called = state.allTickets.any(
    (ticket) =>
        ticket.entryId == next.entryId &&
        ticket.status == QueueStatus.inConsultation,
  );
  if (!called) return; // The screen listener surfaces the action error.

  await showQueueCallAnnouncement(
    context,
    ticket: next,
    doctorName: queueDoctorName(context, state),
  );
}
