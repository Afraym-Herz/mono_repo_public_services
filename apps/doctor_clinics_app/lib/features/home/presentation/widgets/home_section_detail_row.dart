import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// One detail line inside a home section card: a glyph and a caption, with the
/// option to tint the whole row so a warning reads louder than a plain count.
class HomeSectionDetailRow extends StatelessWidget {
  const HomeSectionDetailRow({
    super.key,
    required this.icon,
    required this.label,
    this.color,
    this.emphasized = false,
  });

  /// Leading glyph.
  final IconData icon;

  /// Already-localized caption, e.g. `٥٤ حالة`.
  final String label;

  /// Glyph and caption colour; defaults to the secondary text colour.
  final Color? color;

  /// Paints a soft tinted background behind the row.
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final tint = color ?? context.clinicTextSecondary;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.HOME_CARD_SPACING.h,
      ),
      decoration: emphasized
          ? BoxDecoration(
              color: tint.withValues(alpha: context.clinicIsDark ? 0.20 : 0.10),
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
            )
          : null,
      child: Row(
        children: [
          Icon(icon, size: Dimensions.ICON_SIZE_SMALL.r, color: tint),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            child: ResponsiveText(
              label,
              fontSize: Dimensions.FONT_SIZE_SMALL,
              fontWeight: emphasized ? FontWeight.w600 : FontWeight.w500,
              color: emphasized ? tint : context.clinicTextSecondary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
