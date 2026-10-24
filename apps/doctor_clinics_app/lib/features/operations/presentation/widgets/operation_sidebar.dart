import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_board_stats.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_week.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_alerts_panel.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_quick_stats_panel.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_week_panel.dart';

/// Context column of the operations board (in RTL it docks on the left):
/// week strip, quick stats and derived alerts.
class OperationSidebar extends StatelessWidget {
  const OperationSidebar({
    super.key,
    required this.stats,
    required this.week,
    required this.focusedDay,
    required this.onSelectDay,
    required this.onShowAll,
  });

  final OperationBoardStats stats;
  final List<OperationWeekDay> week;
  final DateTime? focusedDay;
  final ValueChanged<DateTime> onSelectDay;
  final VoidCallback onShowAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OperationWeekPanel(
          days: week,
          focusedDay: focusedDay,
          onSelectDay: onSelectDay,
          onShowAll: onShowAll,
        ),
        OperationQuickStatsPanel(stats: stats),
        OperationAlertsPanel(stats: stats),
      ],
    );
  }
}
