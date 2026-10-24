import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Label/value line used by [OperationQuickStatsPanel].
class OperationQuickStatRow extends StatelessWidget {
  const OperationQuickStatRow({
    super.key,
    required this.label,
    required this.value,
    this.color,
  });

  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_BORDER.h),
      child: Row(
        children: [
          Expanded(
            child: ResponsiveText(
              label,
              fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
              color: context.clinicTextSecondary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ResponsiveText(
            value,
            fontSize: Dimensions.FONT_SIZE_SMALL,
            fontWeight: FontWeight.w700,
            color: color ?? context.clinicTextPrimary,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
