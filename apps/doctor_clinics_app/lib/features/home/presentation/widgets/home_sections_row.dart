import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_appointments_card.dart';
import 'home_operations_card.dart';
import 'home_queue_panel.dart';

/// Two-column dashboard body below the KPI strip.
///
/// The parent dashboard gives this row all remaining height. Both columns
/// stretch to that height: the queue keeps the leading 3/5 and the trailing
/// column splits its height evenly between appointments and operations.
class HomeSectionsRow extends StatelessWidget {
  const HomeSectionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = Dimensions.PADDING_SIZE_EXTRA_SMALL.w;

    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: Dimensions.HOME_PAGE_PADDING.w,
        end: Dimensions.HOME_PAGE_PADDING.w,
        top: Dimensions.PADDING_SIZE_SMALL.h,
        bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(flex: 3, child: HomeQueuePanel()),
          SizedBox(width: gap),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(child: HomeAppointmentsCard()),
                SizedBox(height: gap),
                const Expanded(child: HomeOperationsCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
