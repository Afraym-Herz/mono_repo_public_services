import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_list_filter.dart';
import 'queue_filter_chip.dart';

/// Status tabs with live counts at the head of the queue list.
///
/// Laid out with [Wrap] so the tabs drop onto a second line instead of
/// overflowing on narrow windows.
class QueueFilterBar extends StatelessWidget {
  const QueueFilterBar({
    super.key,
    required this.counts,
    required this.selected,
    required this.onSelected,
  });

  /// Entry count per tab; missing tabs render `(0)`.
  final Map<QueueListFilter, int> counts;

  /// Tab currently filtering the list.
  final QueueListFilter selected;

  /// Called with the tab the user picked.
  final ValueChanged<QueueListFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2,
      children: [
        for (final filter in QueueListFilter.values)
          QueueFilterChip(
            filter: filter,
            count: counts[filter] ?? 0,
            isActive: filter == selected,
            onTap: () => onSelected(filter),
          ),
      ],
    );
  }
}
