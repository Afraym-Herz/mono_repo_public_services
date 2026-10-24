import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_board_stats.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_alert_row.dart';

/// Warning rows derived from the loaded board (pending checks, missing
/// surgeon, outstanding balance).
class OperationAlertsPanel extends StatelessWidget {
  const OperationAlertsPanel({super.key, required this.stats});

  final OperationBoardStats stats;

  @override
  Widget build(BuildContext context) {
    final alerts = <Widget>[];
    if (stats.testsPending > 0) {
      alerts.add(
        OperationAlertRow(
          icon: Icons.fact_check_outlined,
          label: 'operations_board.alerts.pending_tests'.tr(
            namedArgs: {
              'count': OperationFormat.count(stats.testsPending, context),
            },
          ),
          color: context.warningColor,
        ),
      );
    }
    if (stats.unassignedSurgeon > 0) {
      alerts.add(
        OperationAlertRow(
          icon: Icons.person_search_outlined,
          label: 'operations_board.alerts.unassigned_surgeon'.tr(
            namedArgs: {
              'count': OperationFormat.count(stats.unassignedSurgeon, context),
            },
          ),
          color: context.infoColor,
        ),
      );
    }
    if (stats.outstandingBalance > 0) {
      alerts.add(
        OperationAlertRow(
          icon: Icons.account_balance_wallet_outlined,
          label: 'operations_board.alerts.outstanding'.tr(
            namedArgs: {
              'count': OperationFormat.count(stats.outstandingBalance, context),
            },
          ),
          color: context.clinicActionDanger,
        ),
      );
    }

    return AppSectionCard(
      title: 'operations_board.alerts.title'.tr(),
      icon: Icons.notifications_active_outlined,
      animationDelay: const Duration(milliseconds: 290),
      headerColor: AppColors.warning.withValues(alpha: 0.08),
      child: alerts.isEmpty
          ? ResponsiveText(
              'operations_board.alerts.none'.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
            )
          : Column(children: alerts),
    );
  }
}
