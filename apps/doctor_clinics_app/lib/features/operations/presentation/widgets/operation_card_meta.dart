import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_meta_pill.dart';

/// Date, time, surgeon, checklist and balance line of an operation card.
class OperationCardMeta extends StatelessWidget {
  const OperationCardMeta({super.key, required this.entry});

  final OperationEntry entry;

  @override
  Widget build(BuildContext context) {
    final surgeon = entry.operation.surgeonName;
    final totalTests = entry.tests.length;
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
      children: [
        OperationMetaPill(
          icon: Icons.event_outlined,
          label: OperationFormat.date(entry.operation.scheduledDate, context),
        ),
        OperationMetaPill(
          icon: Icons.schedule_outlined,
          label: OperationFormat.time(entry.operation, context),
        ),
        if (surgeon != null && surgeon.trim().isNotEmpty)
          OperationMetaPill(icon: Icons.person_outline_rounded, label: surgeon),
        if (totalTests > 0)
          OperationMetaPill(
            icon: Icons.checklist_rounded,
            label: 'operations_board.card.tests'.tr(
              namedArgs: {
                'done': OperationFormat.count(entry.testsDone, context),
                'total': OperationFormat.count(totalTests, context),
              },
            ),
            color: entry.isReady ? context.successColor : context.warningColor,
          ),
        if (entry.hasBalance)
          OperationMetaPill(
            icon: Icons.account_balance_wallet_outlined,
            label: 'operations_board.card.balance'.tr(
              namedArgs: {
                'amount': OperationFormat.money(entry.balancePiasters, context),
              },
            ),
            color: context.clinicActionDanger,
          ),
      ],
    );
  }
}
