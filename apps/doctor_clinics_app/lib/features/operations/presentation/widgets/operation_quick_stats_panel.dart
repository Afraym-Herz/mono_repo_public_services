import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_board_stats.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_quick_stat_row.dart';

/// Sidebar summary of the board's key aggregates.
class OperationQuickStatsPanel extends StatelessWidget {
  const OperationQuickStatsPanel({super.key, required this.stats});

  final OperationBoardStats stats;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'operations_board.quick_stats.title'.tr(),
      icon: Icons.insights_outlined,
      animationDelay: const Duration(milliseconds: 220),
      child: Column(
        children: [
          OperationQuickStatRow(
            label: 'operations_board.quick_stats.total'.tr(),
            value: OperationFormat.count(stats.total, context),
          ),
          OperationQuickStatRow(
            label: 'operations_board.quick_stats.completed'.tr(),
            value: OperationFormat.count(stats.completed, context),
            color: context.clinicStatusDone,
          ),
          OperationQuickStatRow(
            label: 'operations_board.quick_stats.cancelled'.tr(),
            value: OperationFormat.count(stats.cancelled, context),
            color: context.clinicStatusCancelled,
          ),
          OperationQuickStatRow(
            label: 'operations_board.quick_stats.upcoming'.tr(),
            value: OperationFormat.count(stats.upcoming, context),
            color: context.clinicStatusBooked,
          ),
          OperationQuickStatRow(
            label: 'operations_board.quick_stats.pending_tests'.tr(),
            value: OperationFormat.count(stats.testsPending, context),
            color: context.warningColor,
          ),
        ],
      ),
    );
  }
}
