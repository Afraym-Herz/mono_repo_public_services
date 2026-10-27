import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Label/value line used by the billing detail modals.
class BillingDetailRow extends StatelessWidget {
  const BillingDetailRow({
    super.key,
    required this.label,
    this.value = '',
    this.valueColor,
    this.valueWidget,
  });

  final String label;
  final String value;
  final Color? valueColor;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_BORDER.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ResponsiveText(
              label,
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Flexible(
            child:
                valueWidget ??
                ResponsiveText(
                  value,
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  fontWeight: FontWeight.w600,
                  color: valueColor ?? context.clinicTextPrimary,
                  textAlign: TextAlign.end,
                ),
          ),
        ],
      ),
    );
  }
}
