import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Title block of the expenses banner.
class ExpensesHeaderInfo extends StatelessWidget {
  const ExpensesHeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
          height: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.clinicPrimary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          ),
          child: Icon(
            Icons.wallet_outlined,
            size: Dimensions.ICON_SIZE_DEFAULT.r,
            color: context.clinicPrimary,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ResponsiveText(
                'expenses.title'.tr(),
                fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                fontWeight: FontWeight.w700,
                color: context.clinicTextPrimary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
              ResponsiveText(
                'expenses.subtitle'.tr(),
                fontSize: Dimensions.FONT_SIZE_SMALL,
                color: context.clinicTextSecondary,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
