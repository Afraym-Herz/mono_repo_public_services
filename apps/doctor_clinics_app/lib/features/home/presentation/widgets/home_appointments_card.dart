import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_appointments_details.dart';
import 'home_section_card.dart';
import 'home_section_footer.dart';
import 'home_section_header.dart';
import 'home_section_highlight_tile.dart';

/// Appointments section on the home dashboard.
///
/// Presentational: the date comes from tomorrow's clock, while the counts and
/// the day-booking hint stay localized placeholders until the appointments feed
/// is wired in.
class HomeAppointmentsCard extends StatelessWidget {
  const HomeAppointmentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final tomorrow = DateTime.now().add(const Duration(days: 1));

    return HomeSectionCard(
      animationDelay: const Duration(milliseconds: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeSectionHeader(
            title: 'home_appointments_title'.tr(),
            subtitle: DateConverter.localizedFullDate(tomorrow, locale),
            icon: Icons.event_note_rounded,
          ),
          SizedBox(height: Dimensions.HOME_CARD_SPACING.h),
          HomeSectionHighlightTile(
            icon: Icons.confirmation_number_outlined,
            label: 'home_appointments_day_label'.tr(),
            subtitle: 'home_appointments_doctor'.tr(),
            value: 'home_appointments_day_value'.tr(),
          ),
          SizedBox(height: Dimensions.HOME_CARD_SPACING.h),
          const HomeAppointmentsDetails(),
          HomeSectionFooter(
            label: 'home_appointments_view_all'.tr(),
            route: Routes.appointments,
          ),
        ],
      ),
    );
  }
}
