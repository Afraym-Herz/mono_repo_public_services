import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/expenses/presentation/helpers/expense_columns.dart';

/// Sticky column header of the expense log.
class ExpenseTableHead extends StatelessWidget {
  const ExpenseTableHead({super.key});

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
          for (final header in ExpenseColumns.headers)
            Expanded(
              flex: header.flex,
              child: Align(
                alignment: header.centered
                    ? AlignmentDirectional.center
                    : AlignmentDirectional.centerStart,
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
