import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_board_cubit.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_board_handlers.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_board_view.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_board_layout.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_empty_state.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_filter_bar.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_list.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_sidebar.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_stats_row.dart';

/// Loaded canvas: KPI strip, status tabs and the split board.
class OperationBoardContent extends StatelessWidget {
  const OperationBoardContent({super.key, required this.state});

  final OperationBoardLoaded state;

  @override
  Widget build(BuildContext context) {
    final view = OperationBoardView.of(
      entries: state.entries,
      filter: state.filter,
      focusedDay: state.focusedDay,
    );
    final cubit = context.read<OperationBoardCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OperationStatsRow(stats: view.stats),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        OperationFilterBar(
          counts: view.counts,
          selected: state.filter,
          onSelected: cubit.setFilter,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        OperationBoardLayout(
          main: view.visible.isEmpty
              ? OperationEmptyState(
                  isDayFocus: state.focusedDay != null,
                  onShowAll: cubit.clearFocus,
                )
              : OperationList(
                  entries: view.visible,
                  expandedId: state.expandedId,
                  onToggle: cubit.toggleEntry,
                  onToggleTest: (entry, test) =>
                      OperationBoardHandlers.toggleTest(context, entry, test),
                  onComplete: (entry) =>
                      OperationBoardHandlers.complete(context, entry),
                  onCancel: (entry) =>
                      OperationBoardHandlers.cancel(context, entry),
                  onEdit: (_) => OperationBoardHandlers.edit(context),
                ),
          sidebar: OperationSidebar(
            stats: view.stats,
            week: view.week,
            focusedDay: state.focusedDay,
            onSelectDay: cubit.focusDay,
            onShowAll: cubit.clearFocus,
          ),
        ),
      ],
    );
  }
}
