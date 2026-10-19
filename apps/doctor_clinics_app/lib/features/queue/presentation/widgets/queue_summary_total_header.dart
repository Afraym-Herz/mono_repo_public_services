import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_format.dart';
import '../helpers/queue_summary_data.dart';
import 'queue_summary_icon_chip.dart';

/// Registration count + unit, paired with the people glyph.
class QueueSummaryTotalHeader extends StatelessWidget {
  const QueueSummaryTotalHeader({super.key, required this.data});

  final QueueSummaryData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'queue_summary.registered_today'.tr(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: Dimensions.FONT_SIZE_SMALL.sp,
                  color: context.clinicTextSecondary,
                ),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    QueueFormat.localizedNumber(data.totalRegistered, context),
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE.sp,
                      fontWeight: FontWeight.w700,
                      color: context.clinicTextPrimary,
                    ),
                  ),
                  SizedBox(width: Dimensions.PADDING_SIZE_BORDER.w),
                  Flexible(
                    child: Text(
                      'queue_summary.patients_unit'.tr(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: context.clinicTextSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        QueueSummaryIconChip(
          icon: Icons.groups_2_outlined,
          color: AppColors.clinicStatusBooked,
        ),
      ],
    );
  }
}
