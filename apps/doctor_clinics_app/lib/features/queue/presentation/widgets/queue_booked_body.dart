import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/booked_appointment.dart';
import '../helpers/queue_row_state.dart';
import 'queue_status_badge.dart';

class QueueBookedBody extends StatelessWidget {
  const QueueBookedBody({super.key, required this.appointment});

  final BookedAppointment appointment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final time = DateConverter.withLocalizedDigits(
      appointment.scheduledTime,
      context.locale.toString(),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                appointment.patientName,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.clinicTextPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            const QueueStatusBadge(rowState: QueueRowState.booked),
          ],
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_MEDIUM_BORDER.h),
        Text(
          '${'queue_row.meta.scheduled_at'.tr()} $time',
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.clinicTextSecondary,
            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL.sp,
          ),
        ),
      ],
    );
  }
}
