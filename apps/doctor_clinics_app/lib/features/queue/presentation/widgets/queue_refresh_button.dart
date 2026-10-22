import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Circular refresh trigger for the queue list head.
class QueueRefreshButton extends StatelessWidget {
  const QueueRefreshButton({super.key, this.onTap});

  /// Re-reads today's queue; disabled when `null`.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final diameter = Dimensions.CONTROL_HEIGHT.r;
    return Tooltip(
      message: 'queue_toolbar.refresh'.tr(),
      child: Material(
        color: context.clinicContainer,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: diameter,
            height: diameter,
            child: Icon(
              Icons.refresh_rounded,
              size: Dimensions.ICON_SIZE_DEFAULT.r,
              color: context.clinicPrimaryInk,
            ),
          ),
        ),
      ),
    );
  }
}
