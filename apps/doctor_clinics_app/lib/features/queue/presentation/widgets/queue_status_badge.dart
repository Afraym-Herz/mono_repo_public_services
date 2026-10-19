import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/queue_row_state.dart';
import '../helpers/queue_row_style.dart';

class QueueStatusBadge extends StatelessWidget {
  const QueueStatusBadge({super.key, required this.rowState});

  final QueueRowState rowState;

  @override
  Widget build(BuildContext context) {
    final style = QueueRowStyle.forRowState(rowState);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: style.badgeBgColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
        border: Border.all(color: style.borderColor, width: 1.w),
      ),
      child: Text(
        style.labelKey.tr(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: style.badgeTextColor,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
