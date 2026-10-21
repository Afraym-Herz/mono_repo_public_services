import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Tinted capsule beside the appointments title showing a live count
/// (today's bookings / the current week's bookings).
class AppointmentCountBadge extends StatelessWidget {
  const AppointmentCountBadge({
    super.key,
    required this.labelKey,
    required this.count,
  });

  /// Translation key that receives the `count` named argument.
  final String labelKey;

  final int count;

  @override
  Widget build(BuildContext context) {
    final value = DateConverter.withLocalizedDigits(
      '$count',
      context.locale.toString(),
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicNavActiveBackground,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
      ),
      child: ResponsiveText(
        labelKey.tr(namedArgs: {'count': value}),
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: FontWeight.w600,
        color: context.clinicPrimary,
        maxLines: 1,
      ),
    );
  }
}
