import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'queue_live_badge.dart';

/// Live title row: status dot + localized title + live pill.
class QueueHeaderTitleRow extends StatelessWidget {
  const QueueHeaderTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: Dimensions.ICON_SIZE_VERY_SMALL.r,
          height: Dimensions.ICON_SIZE_VERY_SMALL.r,
          decoration: const BoxDecoration(
            color: AppColors.success,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        Flexible(
          child: ResponsiveText(
            'queue_header.title'.tr(),
            fontSize: Dimensions.FONT_SIZE_LARGE,
            fontWeight: FontWeight.w700,
            color: context.clinicTextPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        const QueueLiveBadge(),
      ],
    );
  }
}
