import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'patient_file_number_pill.dart';
import 'patient_profile_header_actions.dart';

/// Title bar of the patient profile modal: section label, file number, actions.
class PatientProfileHeader extends StatelessWidget {
  const PatientProfileHeader({
    super.key,
    required this.fileNumber,
    required this.isEditing,
    required this.isSaving,
    required this.onEdit,
    required this.onCancel,
    required this.onSave,
    required this.onClose,
  });

  final String fileNumber;
  final bool isEditing;
  final bool isSaving;
  final VoidCallback onEdit;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_LARGE.w,
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: Row(
        children: [
          Icon(
            Icons.badge_outlined,
            size: Dimensions.ICON_SIZE_DEFAULT.r,
            color: context.clinicAccent,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            child: ResponsiveText(
              'patient_profile.title'.tr(),
              fontWeight: FontWeight.w700,
              color: context.clinicTextPrimary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (fileNumber.isNotEmpty) ...[
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Flexible(child: PatientFileNumberPill(fileNumber: fileNumber)),
          ],
          PatientProfileHeaderActions(
            isEditing: isEditing,
            isSaving: isSaving,
            onEdit: onEdit,
            onCancel: onCancel,
            onSave: onSave,
            onClose: onClose,
          ),
        ],
      ),
    );
  }
}
