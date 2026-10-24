import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Thin accent progress bar docked under a KPI figure.
class BillingKpiProgress extends StatelessWidget {
  const BillingKpiProgress({
    super.key,
    required this.value,
    required this.color,
  });

  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      child: LinearProgressIndicator(
        value: value.clamp(0.0, 1.0),
        minHeight: Dimensions.PADDING_SIZE_BORDER.h,
        backgroundColor: color.withValues(alpha: 0.12),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
