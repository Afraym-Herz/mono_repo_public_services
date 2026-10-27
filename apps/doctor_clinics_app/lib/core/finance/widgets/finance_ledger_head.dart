import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/ledger_columns.dart';

/// Sticky column header of the accounts ledger.
class FinanceLedgerHead extends StatelessWidget {
  const FinanceLedgerHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.clinicContainer,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: Row(
        children: [
          for (final header in LedgerColumns.headers)
            Expanded(
              flex: header.flex,
              child: Align(
                alignment: header.alignment,
                child: ResponsiveText(
                  header.labelKey.tr(),
                  fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                  fontWeight: FontWeight.w700,
                  color: context.clinicTextSecondary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
