import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_format.dart';

import 'billing_table_cell.dart';

/// Centered money slot used by billing table rows.
class BillingAmountCell extends StatelessWidget {
  const BillingAmountCell({
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
    return BillingTableCell(
      flex: flex,
      centered: true,
      child: ResponsiveText(
        BillingFormat.amount(piasters, context),
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: fontWeight,
        color: color,
        maxLines: 1,
      ),
    );
  }
}
