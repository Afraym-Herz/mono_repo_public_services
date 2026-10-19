import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Headline figure of a [HomeStatCard], with an optional trailing unit token
/// (e.g. `ج.م.`) rendered in a smaller weight and muted tone.
class HomeStatValue extends StatelessWidget {
  const HomeStatValue({
    super.key,
    required this.value,
    required this.valueColor,
    required this.unitColor,
    this.unit,
  });

  /// Already-formatted headline figure (locale-aware digits).
  final String value;

  /// Optional unit rendered next to [value].
  final String? unit;

  /// Colour of the headline figure.
  final Color valueColor;

  /// Colour of the trailing unit token.
  final Color unitColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Flexible(
          child: ResponsiveText(
            value,
            fontSize: Dimensions.FONT_SIZE_OVER_OVER_LARGE,
            fontWeight: FontWeight.w700,
            color: valueColor,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (unit != null) ...[
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w / 2),
          ResponsiveText(
            unit!,
            fontSize: Dimensions.FONT_SIZE_DEFAULT,
            fontWeight: FontWeight.w600,
            color: unitColor,
            maxLines: 1,
          ),
        ],
      ],
    );
  }
}
