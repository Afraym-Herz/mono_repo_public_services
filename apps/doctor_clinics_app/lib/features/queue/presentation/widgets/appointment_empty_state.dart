import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentEmptyState extends StatelessWidget {
  const AppointmentEmptyState({super.key, required this.canBook});

  /// The booking hint is only shown to the secretary; the doctor is read-only.
  final bool canBook;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.event_available_outlined,
              size: Dimensions.ICON_SIZE_LARGE.r * 2,
              color: context.clinicTextSecondary.withValues(alpha: 0.5),
            ),
            SizedBox(height: Dimensions.paddingSizeDefault.h),
            Text(
              'appointment_empty.title'.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.clinicTextPrimary,
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
            Text(
              (canBook
                      ? 'appointment_empty.subtitle'
                      : 'appointment_empty.subtitle_read_only')
                  .tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: context.clinicTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
