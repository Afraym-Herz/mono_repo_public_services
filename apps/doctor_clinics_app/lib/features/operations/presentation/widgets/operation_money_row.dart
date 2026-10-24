import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Label/value line used by [OperationFinanceSection].
class OperationMoneyRow extends StatelessWidget {
  const OperationMoneyRow({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    this.emphasized = false,
  });

  final String label;
  final String value;
  final Color color;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.PADDING_SIZE_BORDER.h / 2,
      ),
      child: Row(
        children: [
          Expanded(
            child: ResponsiveText(
              label,
              fontSize: Dimensions.FONT_SIZE_SMALL,
              fontWeight: emphasized ? FontWeight.w700 : FontWeight.w500,
              color: context.clinicTextSecondary,
              maxLines: 1,
            ),
          ),
          ResponsiveText(
            value,
            textDirection: TextDirection.ltr,
            fontSize: emphasized
                ? Dimensions.FONT_SIZE_SMALL
                : Dimensions.FONT_SIZE_EXTRA_SMALL,
            fontWeight: emphasized ? FontWeight.w700 : FontWeight.w600,
            color: color,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
