import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'operation_count_badge.dart';

/// Heading block of the operations banner: title, subtitle and count badge.
class OperationHeaderInfo extends StatelessWidget {
  const OperationHeaderInfo({super.key, required this.operationCount});

  final int operationCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: Dimensions.PADDING_SIZE_SMALL.w,
          runSpacing: Dimensions.PADDING_SIZE_BORDER.h,
          children: [
            ResponsiveText(
              'operations_board.header.title'.tr(),
              fontSize: Dimensions.FONT_SIZE_LARGE,
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            OperationCountBadge(count: operationCount),
          ],
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        ResponsiveText(
          'operations_board.header.subtitle'.tr(),
          fontSize: Dimensions.FONT_SIZE_SMALL,
          color: context.clinicTextSecondary,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
