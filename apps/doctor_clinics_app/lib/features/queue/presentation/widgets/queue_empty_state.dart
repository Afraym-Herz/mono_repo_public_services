import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QueueEmptyState extends StatelessWidget {
  const QueueEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.people_outline,
              size: Dimensions.ICON_SIZE_EXTRA_LARGE.sp * 1.5,
              color: context.clinicTextSecondary.withValues(alpha: 0.5),
            ),
            SizedBox(height: Dimensions.paddingSizeDefault.h),
            Text(
              'queue_row.empty'.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: context.clinicTextSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
