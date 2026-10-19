import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_appointments_card.dart';
import 'home_placeholder.dart';
import 'home_queue_panel.dart';

/// Two-column dashboard body below the KPI strip.
///
/// The live queue section takes the leading column (right in RTL, matching the
/// reference) while the trailing column stacks tomorrow's appointments above
/// the remaining sections. Collapses to a single column below
/// [ResponsiveBreakpoints.mobileLarge].
class HomeSectionsRow extends StatelessWidget {
  const HomeSectionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide =
            constraints.maxWidth >= ResponsiveBreakpoints.mobileLarge;
        final gap = Dimensions.PADDING_SIZE_SMALL.w;

        return Padding(
          padding: EdgeInsetsDirectional.only(
            start: Dimensions.HOME_PAGE_PADDING.w,
            end: Dimensions.HOME_PAGE_PADDING.w,
            top: Dimensions.paddingSizeDefault.h,
            bottom: Dimensions.PADDING_SIZE_LARGE.h,
          ),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(flex: 3, child: HomeQueuePanel()),
                    SizedBox(width: gap),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const HomeAppointmentsCard(),
                          SizedBox(height: gap),
                          const HomePlaceholder(),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const HomeQueuePanel(),
                    SizedBox(height: gap),
                    const HomeAppointmentsCard(),
                    SizedBox(height: gap),
                    const HomePlaceholder(),
                  ],
                ),
        );
      },
    );
  }
}
