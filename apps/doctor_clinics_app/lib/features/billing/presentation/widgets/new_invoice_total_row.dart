import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// One label/value line inside the invoice totals card.
class NewInvoiceTotalRow extends StatelessWidget {
  const NewInvoiceTotalRow({
    super.key,
    required this.label,
    required this.value,
    this.emphasized = false,
    this.color,
  });

  final String label;
  final String value;
  final bool emphasized;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: color ?? context.clinicTextPrimary,
      fontWeight: emphasized ? FontWeight.bold : FontWeight.w500,
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_BORDER.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: style,
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Text(value, style: style),
        ],
      ),
    );
  }
}
