import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Quick actions on the queue day banner.
///
/// The secondary "screen call" leads and the primary "add walk-in" trails, so
/// the filled action lands on the leading edge in RTL. Laid out with [Wrap] so
/// the pills drop onto a second line instead of overflowing at narrow widths.
class QueueHeaderActions extends StatelessWidget {
  const QueueHeaderActions({super.key, this.onAddWalkIn, this.onScreenCall});

  /// Adds a walk-in patient to today's queue.
  final VoidCallback? onAddWalkIn;

  /// Broadcasts a general call to the waiting-room screen.
  final VoidCallback? onScreenCall;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
      alignment: WrapAlignment.start,
      children: [
        AppPillButton(
          icon: Icons.campaign_outlined,
          label: 'queue_header.screen_call'.tr(),
          onTap: onScreenCall ?? () {},
        ),
        AppPillButton(
          icon: Icons.person_add_alt_1_outlined,
          label: 'queue_header.add_walk_in'.tr(),
          onTap: onAddWalkIn ?? () {},
          primary: true,
        ),
      ],
    );
  }
}
