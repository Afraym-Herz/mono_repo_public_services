import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_list_filter.dart';
import '../helpers/queue_sort_order.dart';
import 'queue_filter_bar.dart';
import 'queue_list_actions.dart';

/// Head of the queue list: status tabs, ticket ordering and a manual refresh.
/// Below the tablet breakpoint the ordering controls drop under the tabs.
class QueueListToolbar extends StatelessWidget {
  const QueueListToolbar({
    super.key,
    required this.counts,
    required this.selected,
    required this.onFilterSelected,
    required this.sortOrder,
    required this.onSortFlipped,
    this.onRefresh,
    this.delay = Duration.zero,
  });

  /// Entry count per status tab.
  final Map<QueueListFilter, int> counts;

  /// Tab currently filtering the list.
  final QueueListFilter selected;

  /// Called with the tab the user picked.
  final ValueChanged<QueueListFilter> onFilterSelected;

  /// Ordering currently applied to the list.
  final QueueSortOrder sortOrder;

  /// Called when the user asks for the reverse ordering.
  final VoidCallback onSortFlipped;

  /// Re-reads today's queue from the local database.
  final VoidCallback? onRefresh;

  /// Delay before the entrance animation plays.
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final filters = QueueFilterBar(
      counts: counts,
      selected: selected,
      onSelected: onFilterSelected,
    );
    final actions = QueueListActions(
      sortOrder: sortOrder,
      onSortFlipped: onSortFlipped,
      onRefresh: onRefresh,
    );

    return FadeInUp(
      delay: delay,
      duration: const Duration(milliseconds: 300),
      child: context.isMobileOrSmallTablet
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                filters,
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                actions,
              ],
            )
          : Row(
              children: [
                Expanded(child: filters),
                SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
                actions,
              ],
            ),
    );
  }
}
