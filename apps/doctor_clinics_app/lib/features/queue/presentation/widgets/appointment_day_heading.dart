import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Date + count row used to separate days in the planner.
class AppointmentDayHeading extends StatelessWidget {
  const AppointmentDayHeading({
    super.key,
    required this.date,
    required this.count,
    this.showDate = true,
  });

  final DateTime date;
  final int count;
  final bool showDate;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.PADDING_SIZE_SMALL.h,
        bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
      ),
      child: Row(
        children: [
          if (showDate)
            Expanded(
              child: Text(
                DateConverter.localizedFullDate(date, locale),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.clinicTextPrimary,
                ),
              ),
            )
          else
            const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_SMALL.w,
              vertical: Dimensions.PADDING_SIZE_BORDER.h,
            ),
            decoration: BoxDecoration(
              color: context.clinicNavActiveBackground,
              borderRadius: BorderRadius.circular(
                Dimensions.RADIUS_EXTRA_LARGE.r,
              ),
            ),
            child: Text(
              'appointment_day.count'.tr(
                namedArgs: {
                  'count': DateConverter.withLocalizedDigits('$count', locale),
                },
              ),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: context.clinicPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
