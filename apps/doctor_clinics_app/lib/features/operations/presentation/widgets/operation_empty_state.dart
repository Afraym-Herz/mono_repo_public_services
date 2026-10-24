import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Placeholder shown when the active tab/day has no operations.
class OperationEmptyState extends StatelessWidget {
  const OperationEmptyState({
    super.key,
    this.isDayFocus = false,
    this.onShowAll,
  });

  final bool isDayFocus;
  final VoidCallback? onShowAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Column(
        children: [
          Icon(
            Icons.event_busy_outlined,
            size: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
            color: context.clinicTextSecondary.withValues(alpha: 0.6),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          ResponsiveText(
            isDayFocus
                ? 'operations_board.empty.day_title'.tr()
                : 'operations_board.empty.title'.tr(),
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
            fontWeight: FontWeight.w700,
            color: context.clinicTextPrimary,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
          ResponsiveText(
            isDayFocus
                ? 'operations_board.empty.day_subtitle'.tr()
                : 'operations_board.empty.subtitle'.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            textAlign: TextAlign.center,
          ),
          if (isDayFocus && onShowAll != null) ...[
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
            AppPillButton(
              icon: Icons.list_alt_rounded,
              label: 'operations_board.week.show_all'.tr(),
              onTap: onShowAll!,
            ),
          ],
        ],
      ),
    );
  }
}
