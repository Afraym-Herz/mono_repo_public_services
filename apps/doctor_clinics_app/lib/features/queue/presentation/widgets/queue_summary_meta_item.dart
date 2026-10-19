import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Small icon + caption pair used on the current-patient summary card.
class QueueSummaryMetaItem extends StatelessWidget {
  const QueueSummaryMetaItem({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: Dimensions.ICON_SIZE_EXTRA_SMALL.r,
          color: context.clinicTextSecondary,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_BORDER.w),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: Dimensions.FONT_SIZE_SMALL.sp,
            color: context.clinicTextSecondary,
          ),
        ),
      ],
    );
  }
}
