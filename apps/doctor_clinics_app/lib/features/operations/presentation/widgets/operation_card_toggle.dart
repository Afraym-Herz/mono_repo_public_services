import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card_header.dart';

/// Tappable summary strip that expands or collapses a card.
class OperationCardToggle extends StatelessWidget {
  const OperationCardToggle({
    super.key,
    required this.entry,
    required this.isExpanded,
    required this.onToggle,
    required this.radius,
  });

  final OperationEntry entry;
  final bool isExpanded;
  final VoidCallback onToggle;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onToggle,
        child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
          child: Row(
            children: [
              Expanded(child: OperationCardHeader(entry: entry)),
              SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
              Icon(
                isExpanded
                    ? Icons.expand_less_rounded
                    : Icons.expand_more_rounded,
                size: Dimensions.ICON_SIZE_DEFAULT.r,
                color: context.clinicTextSecondary,
                semanticLabel: isExpanded
                    ? 'operations_board.actions.collapse'.tr()
                    : 'operations_board.actions.expand'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
