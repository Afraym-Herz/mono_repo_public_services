import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_sort_order.dart';

/// "ترتيب حسب" caption + ticket-order pill for the queue list head.
///
/// Tapping the pill flips the ordering (`تصاعدي` ⇄ `تنازلي`).
class QueueSortControl extends StatelessWidget {
  const QueueSortControl({super.key, required this.order, required this.onFlip});

  /// Ordering currently applied to the list.
  final QueueSortOrder order;

  /// Called when the user asks for the reverse ordering.
  final VoidCallback onFlip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveText(
          'queue_toolbar.sort_by'.tr(),
          fontSize: Dimensions.FONT_SIZE_SMALL,
          color: context.clinicTextSecondary,
          maxLines: 1,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        Container(
          width: 1,
          height: Dimensions.ICON_SIZE_SMALL.h,
          color: context.clinicBorder,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        AppPillButton(
          icon: order.icon,
          label: order.labelKey.tr(),
          onTap: onFlip,
        ),
      ],
    );
  }
}
