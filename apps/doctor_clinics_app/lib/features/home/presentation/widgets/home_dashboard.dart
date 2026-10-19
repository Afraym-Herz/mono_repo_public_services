import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/home/presentation/widgets/home_appointments_alert.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_greeting_header.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_sections_row.dart';
import 'package:doctor_clinics_app/features/home/presentation/widgets/home_stats_row.dart';

/// Home dashboard canvas rendered inside the workspace shell.
///
/// The canvas always fills the available height: the greeting, alert and KPI
/// strip stay compact at the top while the section row takes every remaining
/// pixel. When the window is shorter than [Dimensions.HOME_MIN_CANVAS_HEIGHT],
/// the complete canvas scales down instead of squeezing the cards or creating
/// a scrollbar.
class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final minHeight = Dimensions.HOME_MIN_CANVAS_HEIGHT.h;
        final availableHeight = constraints.hasBoundedHeight
            ? constraints.maxHeight
            : minHeight;
        final canvasHeight =
            availableHeight < minHeight ? minHeight : availableHeight;

        return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.topCenter,
          child: SizedBox(
            width: constraints.maxWidth,
            height: canvasHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HomeGreetingHeader(),
                const HomeAppointmentsAlert(),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                const HomeStatsRow(),
                const Expanded(child: HomeSectionsRow()),
              ],
            ),
          ),
        );
      },
    );
  }
}
