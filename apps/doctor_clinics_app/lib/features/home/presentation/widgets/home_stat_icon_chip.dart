import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Tinted rounded square that holds a metric card's glyph.
///
/// The tint derives from [color] so each card pairs a coloured icon with a
/// matching soft background chip.
class HomeStatIconChip extends StatelessWidget {
  const HomeStatIconChip({super.key, required this.icon, required this.color});

  /// Glyph rendered inside the chip.
  final IconData icon;

  /// Icon colour; also drives the chip background tint.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.ICON_SIZE_LARGE.r,
      height: Dimensions.ICON_SIZE_LARGE.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: context.clinicIsDark ? 0.20 : 0.12),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
      ),
      child: Icon(icon, size: Dimensions.ICON_SIZE_SMALL.r, color: color),
    );
  }
}
