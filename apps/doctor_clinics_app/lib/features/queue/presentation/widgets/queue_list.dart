import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_board_row.dart';
import '../cubit/queue_cubit.dart';
import '../helpers/queue_board_groups.dart';
import 'queue_board_view.dart';
import 'queue_list_error.dart';
import 'queue_list_skeleton.dart';

class QueueList extends StatelessWidget {
  const QueueList({super.key, this.onTicketTap});

  final ValueChanged<QueueBoardRow>? onTicketTap;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QueueCubit>();
    return BlocBuilder<QueueCubit, QueueState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => const QueueListSkeleton(),
        error: (message) => QueueListError(
          message: message,
          onRetry: cubit.loadTodayQueue,
        ),
        loaded: (tickets, booked, filter, sortOrder, fee, isSubmitting, _) {
          final groups = QueueBoardGroups.build(
            tickets: tickets,
            booked: booked,
            filter: filter,
            sortOrder: sortOrder,
          );
          return QueueBoardView(
            groups: groups,
            onTicketTap: onTicketTap,
            isSubmitting: isSubmitting,
            defaultFeePiasters: fee,
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
