import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_action.dart';

/// Compact quick-action pill on a queue row. Icon-only for actions without a
/// label (e.g. the overflow menu).
class HomeQueueActionButton extends StatelessWidget {
  const HomeQueueActionButton({super.key, required this.action, this.onTap});

  /// Action this button triggers.
  final HomeQueueAction action;

  /// Called when the button is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r);
    final background =
        action.filled ? context.clinicSubmitButton : context.clinicContainer;
    final foreground = action.filled ? AppColors.white : context.clinicPrimary;

    return Material(
      color: background,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_SMALL.w,
            vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                action.icon,
                size: Dimensions.ICON_SIZE_SMALL.r,
                color: foreground,
              ),
              if (action.labelKey != null) ...[
                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w / 2),
                ResponsiveText(
                  action.labelKey!.tr(),
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  fontWeight: FontWeight.w700,
                  color: foreground,
                  maxLines: 1,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
