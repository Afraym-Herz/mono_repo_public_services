import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_stat_icon_chip.dart';

/// Header row of a metric card: the localized [title] on the leading edge and
/// the tinted [icon] chip on the trailing edge.
class HomeStatCardHeader extends StatelessWidget {
  const HomeStatCardHeader({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor,
  });

  /// Already-localized metric label.
  final String title;

  /// Glyph rendered inside the trailing chip.
  final IconData icon;

  /// Chip tint; defaults to the clinical accent.
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ResponsiveText(
            title,
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
            fontWeight: FontWeight.w600,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        HomeStatIconChip(icon: icon, color: iconColor ?? context.clinicAccent),
      ],
    );
  }
}
