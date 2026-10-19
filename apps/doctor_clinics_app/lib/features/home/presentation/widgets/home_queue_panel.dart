import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/demo/queue_demo_store.dart';
import 'home_queue_list.dart';
import 'home_queue_live_badge.dart';
import 'home_section_card.dart';
import 'home_section_header.dart';
import 'home_section_link.dart';

/// "Current queue" section on the home dashboard.
///
/// The card receives the full section height. The header stays at the top, the
/// footer is docked at the bottom, and the queue list fills everything between
/// them, spreading its rows over the available space.
class HomeQueuePanel extends StatelessWidget {
  const HomeQueuePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeSectionCard(
      animationDelay: const Duration(milliseconds: 440),
      fillHeight: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final canExpand = constraints.hasTightHeight;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HomeSectionHeader(
                title: 'home_queue_title'.tr(),
                subtitle: 'home_queue_room'.tr(
                  namedArgs: {'name': 'home_queue_room_name'.tr()},
                ),
                icon: Icons.queue_play_next_rounded,
                trailing: const HomeQueueLiveBadge(),
              ),
              SizedBox(height: Dimensions.HOME_CARD_SPACING.h),
              if (canExpand)
                const Expanded(child: HomeQueueList(expandRows: true))
              else
                const HomeQueueList(),
              SizedBox(height: Dimensions.HOME_CARD_SPACING.h),
              HomeSectionLink(
                label: 'home_queue_view_all'.tr(
                  namedArgs: {
                    'count': DateConverter.withLocalizedDigits(
                      '${QueueDemoStore.instance.homePatients.length}',
                      context.locale.toString(),
                    ),
                  },
                ),
                route: Routes.queue,
              ),
            ],
          );
        },
      ),
    );
  }
}
