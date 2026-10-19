import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Rounded square holding a summary card glyph.
class QueueSummaryIconChip extends StatelessWidget {
  const QueueSummaryIconChip({
    super.key,
    required this.icon,
    required this.color,
    this.filled = false,
  });

  final IconData icon;
  final Color color;

  /// Paints a solid chip with a white glyph instead of a soft tint.
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
      height: Dimensions.ICON_SIZE_EXTRA_LARGE.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: filled
            ? color
            : color.withValues(alpha: context.clinicIsDark ? 0.20 : 0.12),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
      ),
      child: Icon(
        icon,
        size: Dimensions.ICON_SIZE_DEFAULT.r,
        color: filled ? AppColors.surfaceWhite : color,
      ),
    );
  }
}
