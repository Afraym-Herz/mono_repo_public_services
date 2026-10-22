import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Pencil/close in read mode, cancel/save in edit mode.
class PatientProfileHeaderActions extends StatelessWidget {
  const PatientProfileHeaderActions({
    super.key,
    required this.isEditing,
    required this.isSaving,
    required this.onEdit,
    required this.onCancel,
    required this.onSave,
    required this.onClose,
  });

  final bool isEditing;
  final bool isSaving;
  final VoidCallback onEdit;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isEditing) ...[
          _HeaderAction(
            icon: Icons.close_rounded,
            tooltip: 'patient_profile.cancel'.tr(),
            onPressed: isSaving ? null : onCancel,
          ),
          _HeaderAction(
            icon: Icons.check_rounded,
            tooltip: 'patient_profile.save'.tr(),
            onPressed: isSaving ? null : onSave,
            isLoading: isSaving,
          ),
        ] else ...[
          _HeaderAction(
            icon: Icons.edit_outlined,
            tooltip: 'patient_profile.edit'.tr(),
            onPressed: onEdit,
          ),
          _HeaderAction(
            icon: Icons.close_rounded,
            tooltip: 'patient_profile.close'.tr(),
            onPressed: onClose,
          ),
        ],
      ],
    );
  }
}

class _HeaderAction extends StatelessWidget {
  const _HeaderAction({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.isLoading = false,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      color: context.clinicTextSecondary,
      onPressed: onPressed,
      icon: isLoading
          ? SizedBox(
              width: Dimensions.ICON_SIZE_DEFAULT.r,
              height: Dimensions.ICON_SIZE_DEFAULT.r,
              child: const CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(icon),
    );
  }
}
