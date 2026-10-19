import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/queue/data/demo/queue_demo_store.dart';
import 'home_queue_list.dart';
import 'home_queue_live_badge.dart';
import 'home_section_card.dart';
import 'home_section_header.dart';
import 'home_section_link.dart';

/// "Current queue" section on the home dashboard.
///
/// Presentational: [HomeQueueList] renders the sample rows until the panel
/// reads the live queue feed. The footer links to the full queue workspace.
class HomeQueuePanel extends StatelessWidget {
  const HomeQueuePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeSectionCard(
      animationDelay: const Duration(milliseconds: 440),
      child: Column(
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
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          const HomeQueueList(),
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
      ),
    );
  }
}
