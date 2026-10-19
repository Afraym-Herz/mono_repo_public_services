import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_queue_live_badge.dart';
import 'home_stat_icon_chip.dart';

/// Header of the home queue panel: title with the live badge, the exam-room
/// subtitle, and the trailing glyph chip.
class HomeQueuePanelHeader extends StatelessWidget {
  const HomeQueuePanelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: ResponsiveText(
                      'home_queue_title'.tr(),
                      fontSize: Dimensions.FONT_SIZE_LARGE,
                      fontWeight: FontWeight.w700,
                      color: context.clinicTextPrimary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                  const HomeQueueLiveBadge(),
                ],
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2),
              ResponsiveText(
                'home_queue_room'.tr(
                  namedArgs: {'name': 'home_queue_room_name'.tr()},
                ),
                fontSize: Dimensions.FONT_SIZE_SMALL,
                color: context.clinicTextSecondary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        HomeStatIconChip(
          icon: Icons.queue_play_next_rounded,
          color: context.clinicAccent,
        ),
      ],
    );
  }
}
