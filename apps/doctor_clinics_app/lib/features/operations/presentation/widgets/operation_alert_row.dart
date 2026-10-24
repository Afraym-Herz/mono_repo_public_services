import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// One warning line inside [OperationAlertsPanel].
class OperationAlertRow extends StatelessWidget {
  const OperationAlertRow({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_BORDER.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: Dimensions.ICON_SIZE_EXTRA_SMALL.r, color: color),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          Expanded(
            child: ResponsiveText(
              label,
              fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
              fontWeight: FontWeight.w600,
              color: context.clinicTextPrimary,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
