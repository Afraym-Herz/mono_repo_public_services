import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/queue_summary_data.dart';
import 'queue_summary_rate_pill.dart';
import 'queue_summary_surface.dart';
import 'queue_summary_total_header.dart';

/// Today's registration total plus the derived waiting-health pill.
class QueueSummaryTotalCard extends StatelessWidget {
  const QueueSummaryTotalCard({super.key, required this.data});

  final QueueSummaryData data;

  @override
  Widget build(BuildContext context) {
    return QueueSummarySurface(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          QueueSummaryTotalHeader(data: data),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: QueueSummaryRatePill(rating: data.rating),
          ),
        ],
      ),
    );
  }
}
