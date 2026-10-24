import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Headline figure with its small unit suffix.
class BillingKpiValue extends StatelessWidget {
  const BillingKpiValue({
    super.key,
    required this.value,
    required this.unit,
    required this.color,
  });

  final String value;
  final String unit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Flexible(
          child: ResponsiveText(
            value,
            fontSize: Dimensions.FONT_SIZE_LARGE,
            fontWeight: FontWeight.w700,
            color: color,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_BORDER.w),
        ResponsiveText(
          unit,
          fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
          color: context.clinicTextSecondary,
        ),
      ],
    );
  }
}
