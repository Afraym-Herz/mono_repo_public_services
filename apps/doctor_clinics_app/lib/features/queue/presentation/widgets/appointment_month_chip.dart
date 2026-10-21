import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_status_style.dart';

/// Compact patient line inside a month day cell.
class AppointmentMonthChip extends StatelessWidget {
  const AppointmentMonthChip({super.key, required this.item});

  final AppointmentListItem item;

  @override
  Widget build(BuildContext context) {
    final style = AppointmentStatusStyle.forStatus(item.status);
    final locale = context.locale.toString();
    final number = item.queueNumber == null
        ? null
        : DateConverter.withLocalizedDigits('${item.queueNumber}', locale);
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_CARD.h),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_BORDER.w,
        vertical: Dimensions.PADDING_SIZE_CARD.h,
      ),
      decoration: BoxDecoration(
        color: style.background,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      ),
      child: Row(
        children: [
          if (number != null) ...[
            Text(
              number,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: style.color,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_BORDER.w),
          ],
          Expanded(
            child: Text(
              item.patientName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: context.clinicTextPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
