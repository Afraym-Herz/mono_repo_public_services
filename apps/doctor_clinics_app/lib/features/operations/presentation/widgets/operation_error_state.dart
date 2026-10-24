import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Load failure with a retry action.
class OperationErrorState extends StatelessWidget {
  const OperationErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Column(
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
            color: context.clinicActionDanger,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          ResponsiveText(
            'operations_board.error.load'.tr(),
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
            fontWeight: FontWeight.w700,
            color: context.clinicTextPrimary,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
          ResponsiveText(
            message,
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          AppPillButton(
            icon: Icons.refresh_rounded,
            label: 'operations_board.error.retry'.tr(),
            onTap: onRetry,
            primary: true,
          ),
        ],
      ),
    );
  }
}
