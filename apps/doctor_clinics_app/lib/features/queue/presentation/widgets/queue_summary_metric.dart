import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_format.dart';

/// One labelled status counter inside the summary stats card.
class QueueSummaryMetric extends StatelessWidget {
  const QueueSummaryMetric({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelSmall?.copyWith(
            fontSize: Dimensions.FONT_SIZE_SMALL.sp,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_MEDIUM_BORDER.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Dimensions.ICON_SIZE_VERY_SMALL.r / 1.5,
              height: Dimensions.ICON_SIZE_VERY_SMALL.r / 1.5,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_MEDIUM_BORDER.w),
            Text(
              QueueFormat.localizedNumber(value, context),
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE.sp,
                fontWeight: FontWeight.w700,
                color: context.clinicTextPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
