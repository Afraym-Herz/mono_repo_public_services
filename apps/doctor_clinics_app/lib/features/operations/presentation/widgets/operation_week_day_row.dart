import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_week.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_week_day_count.dart';

/// One day cell in the "operations this week" panel.
class OperationWeekDayRow extends StatelessWidget {
  const OperationWeekDayRow({
    super.key,
    required this.day,
    required this.isActive,
    required this.onTap,
  });

  final OperationWeekDay day;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final localeTag = context.locale.toString();
    final radius = BorderRadius.circular(Dimensions.RADIUS_SMALL.r);
    return Material(
      color: isActive
          ? context.clinicNavActiveBackground
          : AppColors.transparent,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
            vertical: Dimensions.PADDING_SIZE_BORDER.h,
          ),
          child: Row(
            children: [
              Expanded(
                child: ResponsiveText(
                  '${DateConverter.localizedWeekdayShort(day.date, localeTag)} '
                  '${DateConverter.localizedShortDate(day.date, localeTag)}',
                  fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                  fontWeight: day.isToday ? FontWeight.w700 : FontWeight.w500,
                  color: isActive
                      ? context.clinicPrimary
                      : context.clinicTextPrimary,
                  maxLines: 1,
                ),
              ),
              OperationWeekDayCount(count: day.count),
            ],
          ),
        ),
      ),
    );
  }
}
