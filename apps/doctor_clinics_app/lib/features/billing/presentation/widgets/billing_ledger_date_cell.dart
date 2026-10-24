import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_ledger_row.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_format.dart';

/// Compact date over the entry's clock time.
class BillingLedgerDateCell extends StatelessWidget {
  const BillingLedgerDateCell({super.key, required this.row});

  final BillingLedgerRow row;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveText(
          BillingFormat.date(row.date, context),
          fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
          color: context.clinicTextPrimary,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
        ResponsiveText(
          BillingFormat.time(row.date, context),
          fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
          color: context.clinicTextSecondary,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
