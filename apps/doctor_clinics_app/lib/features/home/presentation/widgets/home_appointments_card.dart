import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_appointments_first_slot.dart';
import 'home_appointments_stats.dart';
import 'home_section_card.dart';
import 'home_section_header.dart';
import 'home_section_link.dart';

/// Tomorrow's appointments section on the home dashboard.
///
/// Presentational: the date and the first slot come from tomorrow's clock,
/// while the counters stay localized placeholders until the appointments feed
/// is wired in.
class HomeAppointmentsCard extends StatelessWidget {
  const HomeAppointmentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final firstSlot = DateTime(
      tomorrow.year,
      tomorrow.month,
      tomorrow.day,
      9,
      30,
    );

    return HomeSectionCard(
      animationDelay: const Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeSectionHeader(
            title: 'home_appointments_title'.tr(),
            subtitle: DateConverter.localizedFullDate(tomorrow, locale),
            icon: Icons.event_available_outlined,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          HomeAppointmentsFirstSlot(
            time: DateConverter.localizedTime(firstSlot, locale),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          const HomeAppointmentsStats(),
          HomeSectionLink(
            label: 'home_appointments_view_all'.tr(),
            route: Routes.appointments,
          ),
        ],
      ),
    );
  }
}
