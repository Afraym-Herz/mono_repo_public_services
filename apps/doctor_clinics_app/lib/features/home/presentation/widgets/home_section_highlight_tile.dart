import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Highlighted tile that tops a home section card: a glyph on the leading side,
/// a caption over its subtitle, and an emphasised value on the trailing side.
class HomeSectionHighlightTile extends StatelessWidget {
  const HomeSectionHighlightTile({
    super.key,
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.value,
  });

  /// Leading glyph.
  final IconData icon;

  /// Already-localized caption, e.g. `أول موعد`.
  final String label;

  /// Already-localized secondary line, e.g. a doctor's name.
  final String subtitle;

  /// Already-localized emphasised value, e.g. a time.
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicContainer,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        border: Border.all(
          color: context.clinicAccent.withValues(alpha: 0.24),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: Dimensions.ICON_SIZE_DEFAULT.r,
            color: context.clinicAccent,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  label,
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: context.clinicTextSecondary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                ResponsiveText(
                  subtitle,
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                  fontWeight: FontWeight.w600,
                  color: context.clinicTextPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          ResponsiveText(
            value,
            fontSize: Dimensions.FONT_SIZE_LARGE,
            fontWeight: FontWeight.w700,
            color: context.clinicAccent,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
