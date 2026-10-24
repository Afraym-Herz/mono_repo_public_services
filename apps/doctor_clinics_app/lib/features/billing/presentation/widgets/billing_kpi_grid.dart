import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Responsive strip of KPI cards: four across, then 2×2, then one column.
class BillingKpiGrid extends StatelessWidget {
  const BillingKpiGrid({super.key, required this.cards});

  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final gap = Dimensions.PADDING_SIZE_EXTRA_SMALL.w;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _rows(_columnsFor(constraints.maxWidth), gap),
        );
      },
    );
  }

  List<Widget> _rows(int columns, double gap) {
    final rows = <Widget>[];
    for (var start = 0; start < cards.length; start += columns) {
      final end = start + columns > cards.length
          ? cards.length
          : start + columns;
      final rowCards = cards.sublist(start, end);
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var index = 0; index < rowCards.length; index++) ...[
              Expanded(child: rowCards[index]),
              if (index < rowCards.length - 1) SizedBox(width: gap),
            ],
          ],
        ),
      );
      if (end < cards.length) rows.add(SizedBox(height: gap));
    }
    return rows;
  }

  int _columnsFor(double width) {
    if (width >= ResponsiveBreakpoints.mobileLarge) return 4;
    if (width >= ResponsiveBreakpoints.mobileSmall) return 2;
    return 1;
  }
}
