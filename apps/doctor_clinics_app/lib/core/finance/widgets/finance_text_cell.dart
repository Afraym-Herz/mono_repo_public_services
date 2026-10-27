import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'finance_table_cell.dart';

/// Single-line text slot used by billing table rows.
class FinanceTextCell extends StatelessWidget {
  const FinanceTextCell({
    super.key,
    required this.flex,
    required this.text,
    required this.color,
    this.alignment = AlignmentDirectional.centerStart,
    this.fontWeight,
  });

  final int flex;
  final String text;
  final Color color;
  final AlignmentDirectional alignment;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return FinanceTableCell(
      flex: flex,
      alignment: alignment,
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
