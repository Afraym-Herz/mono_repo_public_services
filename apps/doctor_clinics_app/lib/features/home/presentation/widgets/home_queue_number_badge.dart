import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Circled ticket number at the leading edge of a queue row.
class HomeQueueNumberBadge extends StatelessWidget {
  const HomeQueueNumberBadge({super.key, required this.number});

  /// Ticket number to render (localized digits).
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
      height: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.clinicContainer,
        border: Border.all(color: context.clinicBorder),
      ),
      child: ResponsiveText(
        DateConverter.withLocalizedDigits(
          '$number',
          context.locale.toString(),
        ),
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: FontWeight.w700,
        color: context.clinicTextSecondary,
      ),
    );
  }
}
