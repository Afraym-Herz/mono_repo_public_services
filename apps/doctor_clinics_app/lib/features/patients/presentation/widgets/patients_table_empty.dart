import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Empty register / no matches state inside the table card.
class PatientsTableEmpty extends StatelessWidget {
  const PatientsTableEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.groups_outlined,
              size: Dimensions.ICON_SIZE_EXTRA_LARGE.sp,
              color: context.clinicTextSecondary,
            ),
            SizedBox(height: Dimensions.paddingSizeDefault.h),
            ResponsiveText(
              'patients.table.empty'.tr(),
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
            ResponsiveText(
              'patients.table.empty_hint'.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
