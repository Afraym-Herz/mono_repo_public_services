import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Quick actions on a patient row: profile, book appointment, delete.
class PatientRowActions extends StatelessWidget {
  const PatientRowActions({
    super.key,
    required this.onView,
    required this.onBook,
    required this.onDelete,
  });

  final VoidCallback onView;
  final VoidCallback onBook;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _QuickAction(
          icon: Icons.visibility_outlined,
          tooltip: 'patients.table.view'.tr(),
          onPressed: onView,
        ),
        _QuickAction(
          icon: Icons.event_available_outlined,
          tooltip: 'patients.table.book'.tr(),
          onPressed: onBook,
        ),
        _QuickAction(
          icon: Icons.delete_outline_rounded,
          tooltip: 'patients.table.delete'.tr(),
          onPressed: onDelete,
          color: AppColors.clinicError,
        ),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.color,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      iconSize: Dimensions.ICON_SIZE_SMALL.r,
      color: color ?? context.clinicTextSecondary,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      constraints: BoxConstraints.tightFor(
        width: Dimensions.CONTROL_HEIGHT.w * 0.65,
        height: Dimensions.CONTROL_HEIGHT.h * 0.65,
      ),
      icon: Icon(icon),
    );
  }
}
