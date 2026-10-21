import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appointment_nav_chevron.dart';

/// Compact date-range navigator for the appointments header.
///
/// The label shows the day (or the Saturday→Friday week range, or the month);
/// the chevrons step one day/week/month back and forward. The calendar icon is
/// a shortcut back to the current period.
class AppointmentPeriodNav extends StatelessWidget {
  const AppointmentPeriodNav({
    super.key,
    required this.label,
    required this.onPrevious,
    required this.onNext,
    required this.onToday,
  });

  /// Already-localized date or date range.
  final String label;

  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onToday;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.CONTROL_HEIGHT.h,
      decoration: BoxDecoration(
        color: context.clinicContainer,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppointmentNavChevron(
            icon: Icons.chevron_left_rounded,
            tooltip: 'appointment_header.previous'.tr(),
            onTap: onPrevious,
          ),
          AppointmentNavChevron(
            icon: Icons.today_outlined,
            tooltip: 'appointment_toolbar.today'.tr(),
            onTap: onToday,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_MEDIUM_BORDER.w),
          Flexible(
            child: ResponsiveText(
              label,
              fontSize: Dimensions.FONT_SIZE_SMALL,
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          AppointmentNavChevron(
            icon: Icons.chevron_right_rounded,
            tooltip: 'appointment_header.next'.tr(),
            onTap: onNext,
          ),
        ],
      ),
    );
  }
}
