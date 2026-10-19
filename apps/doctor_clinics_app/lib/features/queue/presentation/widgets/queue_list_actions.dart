import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_sort_order.dart';
import 'queue_refresh_button.dart';
import 'queue_sort_control.dart';

/// Trailing controls of the queue list head: ticket ordering + manual refresh.
class QueueListActions extends StatelessWidget {
  const QueueListActions({
    super.key,
    required this.sortOrder,
    required this.onSortFlipped,
    this.onRefresh,
  });

  /// Ordering currently applied to the list.
  final QueueSortOrder sortOrder;

  /// Called when the user asks for the reverse ordering.
  final VoidCallback onSortFlipped;

  /// Re-reads today's queue from the local database.
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        QueueSortControl(order: sortOrder, onFlip: onSortFlipped),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        QueueRefreshButton(onTap: onRefresh),
      ],
    );
  }
}
