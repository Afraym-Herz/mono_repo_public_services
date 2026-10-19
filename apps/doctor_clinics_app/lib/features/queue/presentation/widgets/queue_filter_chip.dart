import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_list_filter.dart';

/// One status tab at the head of the queue list: caption + entry count.
///
/// The active tab sits on the tinted primary container (DESIGN (2).md "active
/// side-nav" tone); the rest stay flat so the row reads as one filter strip.
class QueueFilterChip extends StatelessWidget {
  const QueueFilterChip({
    super.key,
    required this.filter,
    required this.count,
    required this.isActive,
    required this.onTap,
  });

  /// Tab this chip represents.
  final QueueListFilter filter;

  /// Number of queue entries matching [filter].
  final int count;

  /// Whether this tab currently filters the list.
  final bool isActive;

  /// Called when the chip is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r);
    return Material(
      color: isActive
          ? context.clinicNavActiveBackground
          : AppColors.transparent,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_SMALL.w,
            vertical: Dimensions.PADDING_SIZE_BORDER.h,
          ),
          child: ResponsiveText(
            '${filter.labelKey.tr()} (${_localizedCount(context)})',
            fontSize: Dimensions.FONT_SIZE_SMALL,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
            color: isActive
                ? context.clinicPrimary
                : context.clinicTextSecondary,
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  /// Count rendered with the locale's own digits (`٣` in Arabic).
  String _localizedCount(BuildContext context) =>
      DateConverter.withLocalizedDigits('$count', context.locale.toString());
}
