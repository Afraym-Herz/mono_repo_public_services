import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'queue_header_meta_row.dart';
import 'queue_header_title_row.dart';

/// Leading half of [TodayQueueHeader]: the live title and today's session line.
class QueueHeaderInfo extends StatelessWidget {
  const QueueHeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const QueueHeaderTitleRow(),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        const QueueHeaderMetaRow(),
      ],
    );
  }
}
