import 'package:easy_localization/easy_localization.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_detail_block.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_test_row.dart';

/// Pre-operation checklist with inline toggles.
class OperationTestsSection extends StatelessWidget {
  const OperationTestsSection({
    super.key,
    required this.entry,
    required this.onToggle,
  });

  final OperationEntry entry;
  final ValueChanged<OperationRequiredTest> onToggle;

  @override
  Widget build(BuildContext context) {
    final total = entry.tests.length;
    return OperationDetailBlock(
      title: 'operations_board.tests.title'.tr(),
      icon: Icons.fact_check_outlined,
      trailing: total == 0
          ? null
          : ResponsiveText(
              'operations_board.tests.progress'.tr(
                namedArgs: {
                  'done': OperationFormat.count(entry.testsDone, context),
                  'total': OperationFormat.count(total, context),
                },
              ),
              fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
              fontWeight: FontWeight.w600,
              color: entry.isReady
                  ? context.clinicStatusDone
                  : context.warningColor,
              maxLines: 1,
            ),
      child: total == 0
          ? ResponsiveText(
              'operations_board.tests.empty'.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
            )
          : Column(
              children: [
                for (final test in entry.tests)
                  OperationTestRow(
                    label: test.testName,
                    isDone: test.isDone ?? false,
                    onTap: () => onToggle(test),
                  ),
              ],
            ),
    );
  }
}
