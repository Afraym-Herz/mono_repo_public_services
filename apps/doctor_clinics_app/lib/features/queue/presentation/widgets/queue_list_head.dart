import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/queue_cubit.dart';
import '../helpers/queue_list_filter.dart';
import 'queue_list_toolbar.dart';

/// [QueueListToolbar] bound to [QueueCubit]: live per-status counts plus the
/// tab / ticket-ordering actions. Counts include booked appointments for all/waiting.
class QueueListHead extends StatelessWidget {
  const QueueListHead({super.key, this.delay = Duration.zero});

  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QueueCubit, QueueState>(
      builder: (context, state) {
        final cubit = context.read<QueueCubit>();
        return QueueListToolbar(
          counts: QueueListFilter.countByTab(
            state.allTickets,
            bookedCount: state.allBooked.length,
          ),
          selected: state.listFilter,
          onFilterSelected: (filter) => cubit.updateListSelection(
            filter: filter,
          ),
          sortOrder: state.listSortOrder,
          onSortFlipped: () => cubit.updateListSelection(
            sortOrder: state.listSortOrder.flipped,
          ),
          onRefresh: cubit.refresh,
          delay: delay,
        );
      },
    );
  }
}
