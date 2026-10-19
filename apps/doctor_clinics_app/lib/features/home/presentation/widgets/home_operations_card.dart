import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_operations_details.dart';
import 'home_section_card.dart';
import 'home_section_footer.dart';
import 'home_section_header.dart';
import 'home_section_highlight_tile.dart';

/// Upcoming operations section on the home dashboard.
///
/// Presentational: the theatre's first slot comes from tomorrow's clock, while
/// the counts stay localized placeholders until the theatre feed is wired in.
class HomeOperationsCard extends StatelessWidget {
  const HomeOperationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final firstOperation = DateTime(
      tomorrow.year,
      tomorrow.month,
      tomorrow.day,
      10,
    );

    return HomeSectionCard(
      animationDelay: const Duration(milliseconds: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeSectionHeader(
            title: 'home_operations_title'.tr(),
            subtitle: DateConverter.localizedFullDate(tomorrow, locale),
            icon: Icons.medical_services_outlined,
          ),
          SizedBox(height: Dimensions.HOME_CARD_SPACING.h),
          HomeSectionHighlightTile(
            icon: Icons.schedule_rounded,
            label: 'home_operations_first_label'.tr(),
            subtitle: 'home_operations_lead'.tr(),
            value: DateConverter.localizedTime(firstOperation, locale),
          ),
          SizedBox(height: Dimensions.HOME_CARD_SPACING.h),
          const HomeOperationsDetails(),
          HomeSectionFooter(
            label: 'home_operations_view_all'.tr(),
            route: Routes.operations,
          ),
        ],
      ),
    );
  }
}
