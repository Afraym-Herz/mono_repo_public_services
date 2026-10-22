import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// What the secretary chose when the new name is already on file.
enum PatientDuplicateChoice { createAnyway, useExisting }

/// Asks before writing a patient whose name already exists.
Future<PatientDuplicateChoice?> showPatientDuplicateDialog(
  BuildContext context, {
  required Patient existing,
}) {
  return showGeneralDialog<PatientDuplicateChoice>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: AppColors.scrim,
    pageBuilder: (_, _, _) => _PatientDuplicateDialog(existing: existing),
  );
}

class _PatientDuplicateDialog extends StatelessWidget {
  const _PatientDuplicateDialog({required this.existing});

  final Patient existing;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Dialog(
      backgroundColor: context.cardColor,
      surfaceTintColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE.r),
        side: BorderSide(color: context.clinicBorder),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 420.w),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'patient_form.duplicate_title'.tr(),
                style: text.titleMedium?.copyWith(
                  color: context.clinicTextPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
              Text(
                'patient_form.duplicate_body'.tr(
                  namedArgs: {
                    'name': existing.fullName,
                    'file': existing.fileNumber,
                  },
                ),
                style: text.bodyMedium?.copyWith(
                  color: context.clinicTextSecondary,
                ),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
              AppButton(
                label: 'patient_form.duplicate_use_existing'.tr(),
                height: Dimensions.CONTROL_HEIGHT.h,
                onPressed: () =>
                    Navigator.pop(context, PatientDuplicateChoice.useExisting),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
              AppButton(
                label: 'patient_form.duplicate_create_anyway'.tr(),
                outlined: true,
                height: Dimensions.CONTROL_HEIGHT.h,
                onPressed: () =>
                    Navigator.pop(context, PatientDuplicateChoice.createAnyway),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('patient_form.duplicate_cancel'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
