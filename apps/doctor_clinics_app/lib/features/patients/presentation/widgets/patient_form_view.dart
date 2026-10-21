import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patient_form_controller.dart';
import 'patient_form_fields.dart';
import 'patient_form_footer.dart';
import 'patient_form_header.dart';

/// Dialog shell for the new-patient form.
class PatientFormView extends StatelessWidget {
  const PatientFormView({
    super.key,
    required this.controller,
    required this.onClose,
    required this.onSave,
  });

  final PatientFormController controller;
  final VoidCallback onClose;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: AppColors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_LARGE.w,
        vertical: Dimensions.PADDING_SIZE_LARGE.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE.r),
        side: BorderSide(color: context.clinicBorder),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 520.w,
          maxHeight: MediaQuery.sizeOf(context).height * 0.86,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PatientFormHeader(onClose: onClose),
            Flexible(
              child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    Dimensions.PADDING_SIZE_LARGE.w,
                    0,
                    Dimensions.PADDING_SIZE_LARGE.w,
                    Dimensions.PADDING_SIZE_LARGE.h,
                  ),
                  child: PatientFormFields(controller: controller),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                Dimensions.PADDING_SIZE_LARGE.w,
                Dimensions.PADDING_SIZE_SMALL.h,
                Dimensions.PADDING_SIZE_LARGE.w,
                Dimensions.PADDING_SIZE_LARGE.h,
              ),
              child: PatientFormFooter(onCancel: onClose, onSave: onSave),
            ),
          ],
        ),
      ),
    );
  }
}
