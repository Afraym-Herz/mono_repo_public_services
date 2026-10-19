import 'package:flutter/material.dart';

/// Quick action offered on a home "current queue" row.
enum HomeQueueAction {
  finish(
    labelKey: 'home_queue_action_finish',
    icon: Icons.check_circle_outline_rounded,
    filled: false,
  ),
  call(
    labelKey: 'home_queue_action_call',
    icon: Icons.campaign_outlined,
    filled: true,
  ),
  start(
    labelKey: 'home_queue_action_start',
    icon: Icons.play_circle_outline_rounded,
    filled: true,
  ),
  checkIn(
    labelKey: 'home_queue_action_check_in',
    icon: Icons.login_rounded,
    filled: false,
  ),
  more(labelKey: null, icon: Icons.more_vert_rounded, filled: false);

  const HomeQueueAction({
    required this.labelKey,
    required this.icon,
    required this.filled,
  });

  /// `.tr()` key for the action caption, or `null` for an icon-only action.
  final String? labelKey;

  /// Leading glyph for the action button.
  final IconData icon;

  /// When `true` the button is filled with the primary tone.
  final bool filled;
}
