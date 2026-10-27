import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card_header.dart';

/// Tappable summary strip that opens the operation details modal.
class OperationCardSummary extends StatelessWidget {
  const OperationCardSummary({
    super.key,
    required this.entry,
    required this.onOpen,
    required this.radius,
  });

  final OperationEntry entry;
  final VoidCallback onOpen;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    final isRtl = Bidi.isRtlLanguage(context.locale.languageCode);
    return Material(
      color: AppColors.transparent,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onOpen,
        child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
          child: Row(
            children: [
              Expanded(child: OperationCardHeader(entry: entry)),
              SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
              Icon(
                isRtl ? Icons.chevron_left_rounded : Icons.chevron_right_rounded,
                size: Dimensions.ICON_SIZE_DEFAULT.r,
                color: context.clinicTextSecondary,
                semanticLabel: 'operations_board.actions.expand'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
