import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_stat_value.dart';

/// Body of a [HomeStatCard]: the headline value with an optional caption and an
/// optional custom footer detail row.
class HomeStatCardBody extends StatelessWidget {
  const HomeStatCardBody({
    super.key,
    required this.value,
    this.unit,
    this.subtitle,
    this.footer,
  });

  /// Already-formatted headline figure (locale-aware digits).
  final String value;

  /// Optional unit rendered next to [value], e.g. `ج.م.`.
  final String? unit;

  /// Optional caption rendered under [value], e.g. `مريض مسجل`.
  final String? subtitle;

  /// Optional custom detail row docked at the bottom of the card.
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeStatValue(
          value: value,
          unit: unit,
          valueColor: context.clinicTextPrimary,
          unitColor: context.clinicTextSecondary,
        ),
        if (subtitle != null) ...[
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2),
          ResponsiveText(
            subtitle!,
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        if (footer != null) ...[
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          footer!,
        ],
      ],
    );
  }
}
