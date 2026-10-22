import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'queue_header_actions.dart';
import 'queue_header_info.dart';

/// "Today's queue" banner docked directly under the workspace top bar on the
/// queue screen.
///
/// Mirrors the home greeting header: the live heading + clinic session window
/// sit on the leading edge, the quick queue actions on the trailing edge. Below
/// the small-tablet breakpoint the actions drop under the heading instead of
/// overflowing.
class TodayQueueHeader extends StatelessWidget {
  const TodayQueueHeader({
    super.key,
    this.onAddWalkIn,
    this.onScreenCall,
    this.isAddWalkInEnabled = true,
  });

  /// Adds a walk-in patient to today's queue.
  final VoidCallback? onAddWalkIn;

  /// Broadcasts a general call to the waiting-room screen.
  final VoidCallback? onScreenCall;

  /// Whether the walk-in pill accepts taps. Kept separate from [onAddWalkIn]
  /// so the pill stays mounted (and the header keeps its layout) while a
  /// queue action is submitting.
  final bool isAddWalkInEnabled;

  @override
  Widget build(BuildContext context) {
    final actions = QueueHeaderActions(
      onAddWalkIn: onAddWalkIn,
      onScreenCall: onScreenCall,
      isAddWalkInEnabled: isAddWalkInEnabled,
    );

    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE.w,
          vertical: Dimensions.PADDING_SIZE_LARGE.h,
        ),
        child: context.isMobileOrSmallTablet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const QueueHeaderInfo(),
                  SizedBox(height: Dimensions.paddingSizeDefault.h),
                  actions,
                ],
              )
            : Row(
                children: [
                  const Expanded(child: QueueHeaderInfo()),
                  SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
                  actions,
                ],
              ),
      ),
    );
  }
}
