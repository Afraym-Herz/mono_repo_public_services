import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_sample.dart';
import 'home_queue_row_content.dart';

/// Single row in the "current queue" home dashboard section.
///
/// Inside the expanding queue list the row gets a tight height. Its content is
/// vertically centred and scales down only if the row is shorter than the
/// content, keeping every row usable without overflow.
class HomeQueueRow extends StatelessWidget {
  const HomeQueueRow({super.key, required this.sample});

  /// Sample row rendered by this widget.
  final HomeQueueSampleRow sample;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.clinicBorder)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final content = HomeQueueRowContent(sample: sample);
          if (!constraints.hasBoundedHeight || !constraints.hasTightHeight) {
            return content;
          }
          return FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: SizedBox(
              width: constraints.maxWidth,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: content,
              ),
            ),
          );
        },
      ),
    );
  }
}
