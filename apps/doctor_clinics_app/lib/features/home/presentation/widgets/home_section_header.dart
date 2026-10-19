import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_stat_icon_chip.dart';

/// Shared header for the home dashboard section cards: title (with an optional
/// trailing badge) and a subtitle on the leading side, tinted glyph chip on the
/// trailing side.
class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.trailing,
  });

  /// Already-localized section title.
  final String title;

  /// Already-localized subtitle line.
  final String subtitle;

  /// Glyph rendered in the tinted chip.
  final IconData icon;

  /// Optional widget docked next to the title, e.g. a live badge.
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: ResponsiveText(
                      title,
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      fontWeight: FontWeight.w700,
                      color: context.clinicTextPrimary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (trailing != null) ...[
                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                    trailing!,
                  ],
                ],
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2),
              ResponsiveText(
                subtitle,
                fontSize: Dimensions.FONT_SIZE_SMALL,
                color: context.clinicTextSecondary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        HomeStatIconChip(icon: icon, color: context.clinicAccent),
      ],
    );
  }
}
