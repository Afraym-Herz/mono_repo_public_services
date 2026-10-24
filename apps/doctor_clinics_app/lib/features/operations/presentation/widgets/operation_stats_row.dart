import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_board_stats.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_stat_card.dart';

/// KPI strip above the operations board.
class OperationStatsRow extends StatelessWidget {
  const OperationStatsRow({super.key, required this.stats});

  final OperationBoardStats stats;

  @override
  Widget build(BuildContext context) {
    final cards = [
      OperationStatCard(
        title: 'operations_board.stats.total'.tr(),
        value: OperationFormat.count(stats.total, context),
        icon: Icons.medical_services_outlined,
        color: context.clinicPrimary,
        animationDelay: const Duration(milliseconds: 100),
      ),
      OperationStatCard(
        title: 'operations_board.stats.today'.tr(),
        value: OperationFormat.count(stats.today, context),
        icon: Icons.event_available_outlined,
        color: context.infoColor,
        animationDelay: const Duration(milliseconds: 170),
      ),
      OperationStatCard(
        title: 'operations_board.stats.completed'.tr(),
        value: OperationFormat.count(stats.completed, context),
        icon: Icons.check_circle_outline_rounded,
        color: context.successColor,
        animationDelay: const Duration(milliseconds: 240),
      ),
      OperationStatCard(
        title: 'operations_board.stats.upcoming'.tr(),
        value: OperationFormat.count(stats.upcoming, context),
        icon: Icons.schedule_outlined,
        color: context.warningColor,
        animationDelay: const Duration(milliseconds: 310),
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth < 700 ? 2 : 4;
        final gap = Dimensions.PADDING_SIZE_SMALL.w;
        final cardWidth =
            (constraints.maxWidth - gap * (columns - 1)) / columns;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final card in cards) SizedBox(width: cardWidth, child: card),
          ],
        );
      },
    );
  }
}
