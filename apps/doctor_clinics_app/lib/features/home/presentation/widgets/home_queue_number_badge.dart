import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Circled ticket number at the leading edge of a queue row.
///
/// [isActive] fills the circle with the clinic accent for the patient currently
/// in consultation, matching the design mock.
class HomeQueueNumberBadge extends StatelessWidget {
  const HomeQueueNumberBadge({
    super.key,
    required this.number,
    this.isActive = false,
  });

  /// Ticket number to render (localized digits).
  final int number;

  /// Whether this ticket is the one in consultation.
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.ICON_SIZE_LARGE.r,
      height: Dimensions.ICON_SIZE_LARGE.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? context.clinicAccent : context.clinicContainer,
        border: isActive ? null : Border.all(color: context.clinicBorder),
      ),
      child: ResponsiveText(
        DateConverter.withLocalizedDigits('$number', context.locale.toString()),
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: FontWeight.w700,
        color: isActive ? context.clinicOnAccent : context.clinicTextSecondary,
      ),
    );
  }
}
