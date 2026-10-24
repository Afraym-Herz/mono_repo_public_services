import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// "Show all" reset shown when a week day is focused.
class OperationWeekShowAll extends StatelessWidget {
  const OperationWeekShowAll({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.PADDING_SIZE_BORDER.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.list_alt_rounded,
                size: Dimensions.ICON_SIZE_EXTRA_SMALL.r,
                color: context.clinicPrimary,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_BORDER.w),
              ResponsiveText(
                'operations_board.week.show_all'.tr(),
                fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                fontWeight: FontWeight.w600,
                color: context.clinicPrimary,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
