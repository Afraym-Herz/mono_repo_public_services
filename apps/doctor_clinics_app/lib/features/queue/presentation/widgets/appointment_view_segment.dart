import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// One option inside [AppointmentViewSwitcher].
///
/// The selected segment becomes a raised surface pill; the others stay flat and
/// muted on the track.
class AppointmentViewSegment extends StatelessWidget {
  const AppointmentViewSegment({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_SMALL.r);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isActive
            ? (context.clinicIsDark
                  ? AppColors.clinicBorderDark
                  : AppColors.surfaceWhite)
            : AppColors.transparent,
        borderRadius: radius,
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: Material(
        color: AppColors.transparent,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE.w,
            ),
            child: Center(
              child: ResponsiveText(
                label,
                fontSize: Dimensions.FONT_SIZE_SMALL,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive
                    ? context.clinicAccent
                    : context.clinicTextSecondary,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
