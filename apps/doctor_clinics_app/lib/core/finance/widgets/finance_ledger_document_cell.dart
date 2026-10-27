import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/finance/domain/ledger_row.dart';

/// Invoice number with its latest receipt number underneath.
class FinanceLedgerDocumentCell extends StatelessWidget {
  const FinanceLedgerDocumentCell({super.key, required this.row});

  final LedgerRow row;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveText(
          row.number,
          fontSize: Dimensions.FONT_SIZE_SMALL,
          fontWeight: FontWeight.w600,
          color: context.clinicTextPrimary,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (row.receiptNumber.isNotEmpty) ...[
          SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
          ResponsiveText(
            row.receiptNumber,
            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}
