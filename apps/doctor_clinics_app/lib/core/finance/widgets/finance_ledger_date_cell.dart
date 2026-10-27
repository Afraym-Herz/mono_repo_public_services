import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/finance/domain/ledger_row.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';

/// Compact date over the entry's clock time.
class FinanceLedgerDateCell extends StatelessWidget {
  const FinanceLedgerDateCell({super.key, required this.row});

  final LedgerRow row;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ResponsiveText(
            FinanceFormat.date(row.date, context),
            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
            color: context.clinicTextPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
          ResponsiveText(
            FinanceFormat.time(row.date, context),
            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
