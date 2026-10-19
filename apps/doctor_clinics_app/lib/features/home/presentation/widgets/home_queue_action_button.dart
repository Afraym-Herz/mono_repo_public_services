import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/home/presentation/helpers/home_queue_action.dart';

/// Compact quick-action pill on a queue row.
///
/// Filled actions use the clinical primary tone; the rest sit on a white
/// (surface) pill with a hairline border so secondary actions — such as
/// "finish" — read differently from the primary ones. Actions without a label
/// (the overflow menu) render as a bare glyph.
class HomeQueueActionButton extends StatelessWidget {
  const HomeQueueActionButton({super.key, required this.action, this.onTap});

  /// Action this button triggers.
  final HomeQueueAction action;

  /// Called when the button is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r);
    final filled = action.filled;
    final background = filled
        ? context.clinicSubmitButton
        : context.clinicIsDark
            ? context.clinicContainer
            : context.cardColor;
    final foreground = filled ? AppColors.white : context.clinicPrimary;

    return Material(
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: filled
            ? BorderSide.none
            : BorderSide(color: context.clinicBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
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
