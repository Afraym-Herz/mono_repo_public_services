import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Highlighted "first appointment" block: label and doctor on the leading side,
/// the localized time on the trailing side.
class HomeAppointmentsFirstSlot extends StatelessWidget {
  const HomeAppointmentsFirstSlot({super.key, required this.time});

  /// Already-localized first appointment time.
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicContainer,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        border: Border.all(
          color: context.clinicAccent.withValues(alpha: 0.24),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.schedule_rounded,
            size: Dimensions.ICON_SIZE_DEFAULT.r,
            color: context.clinicAccent,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  'home_appointments_first_label'.tr(),
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: context.clinicTextSecondary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                ResponsiveText(
                  'home_appointments_doctor'.tr(),
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  fontWeight: FontWeight.w600,
                  color: context.clinicTextPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          ResponsiveText(
            time,
            fontSize: Dimensions.FONT_SIZE_LARGE,
            fontWeight: FontWeight.w700,
            color: context.clinicAccent,
          ),
        ],
      ),
    );
  }
}
