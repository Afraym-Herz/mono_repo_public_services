import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Responsive strip layout for the home KPI cards.
///
/// Shows the cards four across on the desktop canvas, a 2×2 grid on medium
/// widths, and a single column on phones. Each row stretches to equal height so
/// the tiles stay aligned regardless of their content.
class HomeStatsGrid extends StatelessWidget {
  const HomeStatsGrid({super.key, required this.cards});

  /// Tiles to lay out, in leading-to-trailing order.
  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final gap = Dimensions.paddingSizeDefault.w;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _rows(_columnsFor(constraints.maxWidth), gap),
        );
      },
    );
  }

  /// Builds equal-height rows of [columns] tiles separated by vertical [gap]s.
  List<Widget> _rows(int columns, double gap) {
    final rows = <Widget>[];
    for (var start = 0; start < cards.length; start += columns) {
      final end = start + columns > cards.length
          ? cards.length
          : start + columns;
      final rowCards = cards.sublist(start, end);
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < rowCards.length; i++) ...[
                Expanded(child: rowCards[i]),
                if (i < rowCards.length - 1) SizedBox(width: gap),
              ],
            ],
          ),
        ),
      );
      if (end < cards.length) rows.add(SizedBox(height: gap));
    }
    return rows;
  }

  /// Four tiles on the desktop canvas, two on tablets, one on phones.
  int _columnsFor(double width) {
    if (width >= ResponsiveBreakpoints.tablet) return 4;
    if (width >= ResponsiveBreakpoints.mobile) return 2;
    return 1;
  }
}
