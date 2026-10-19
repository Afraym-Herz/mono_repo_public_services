import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_queue_list.dart';
import 'home_queue_panel_footer.dart';
import 'home_queue_panel_header.dart';

/// "Current queue" section on the home dashboard.
///
/// Presentational: [HomeQueueList] renders the sample rows until the panel
/// reads the live queue feed. The footer links to the full queue workspace.
class HomeQueuePanel extends StatelessWidget {
  const HomeQueuePanel({super.key});

  @override
  Widget build(BuildContext context) {
    final surface =
        context.clinicIsDark ? context.clinicContainer : context.cardColor;

    return FadeInUp(
      delay: const Duration(milliseconds: 440),
      duration: const Duration(milliseconds: 400),
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
          border: Border.all(color: context.clinicBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HomeQueuePanelHeader(),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
            const HomeQueueList(),
            const HomeQueuePanelFooter(),
          ],
        ),
      ),
    );
  }
}
