import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_sample.dart';
import 'home_queue_row.dart';

/// Scrollable stack of queue rows.
///
/// The viewport is capped at roughly four rows so the panel never outgrows the
/// dashboard canvas: the header and the "view full queue" footer stay docked
/// while the rows themselves scroll.
class HomeQueueList extends StatelessWidget {
  const HomeQueueList({super.key});

  /// Cap for the scrolling viewport (about four rows).
  static const double _maxHeight = 220.0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: _maxHeight.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final row in homeQueueSampleRows) HomeQueueRow(sample: row),
          ],
        ),
      ),
    );
  }
}
