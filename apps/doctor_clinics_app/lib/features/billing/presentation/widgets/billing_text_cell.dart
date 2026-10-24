import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'billing_table_cell.dart';

/// Single-line text slot used by billing table rows.
class BillingTextCell extends StatelessWidget {
  const BillingTextCell({
    super.key,
    required this.flex,
    required this.text,
    required this.color,
    this.centered = false,
    this.fontWeight,
  });

  final int flex;
  final String text;
  final Color color;
  final bool centered;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return BillingTableCell(
      flex: flex,
      centered: centered,
      child: ResponsiveText(
        text,
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: fontWeight,
        color: color,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
