import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_sample.dart';
import 'home_queue_row.dart';

/// Queue rows for the home dashboard.
///
/// When [expandRows] is true the list must live in a bounded height; each row
/// then receives an equal share of that height so the queue fills the card.
/// Rows keep their content centred and scale it down only when the row is too
/// short, so no internal scrollbar or overflow is needed.
class HomeQueueList extends StatelessWidget {
  const HomeQueueList({super.key, this.expandRows = false});

  /// Whether rows should grow to split the available height.
  final bool expandRows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final row in homeQueueSampleRows(context))
          if (expandRows)
            Expanded(child: HomeQueueRow(sample: row))
          else
            HomeQueueRow(sample: row),
      ],
    );
  }
}
