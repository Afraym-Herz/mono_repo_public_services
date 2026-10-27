import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';

import 'finance_table_cell.dart';

/// Centered money slot used by billing table rows.
class FinanceAmountCell extends StatelessWidget {
  const FinanceAmountCell({
    super.key,
    required this.flex,
    required this.piasters,
    required this.color,
    this.fontWeight = FontWeight.w600,
  });

  final int flex;
  final int piasters;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return FinanceTableCell(
      flex: flex,
      alignment: AlignmentDirectional.centerEnd,
      child: ResponsiveText(
        FinanceFormat.amount(piasters, context),
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: fontWeight,
        color: color,
        maxLines: 1,
      ),
    );
  }
}
