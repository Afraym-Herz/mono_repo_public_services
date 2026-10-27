import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_fields.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_footer.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_header.dart';

/// Dialog shell for the operation form (new and edit modes).
class OperationFormView extends StatelessWidget {
  const OperationFormView({
    super.key,
    required this.controller,
    required this.isEditing,
    required this.onClose,
    required this.onSave,
  });

  final OperationFormController controller;
  final bool isEditing;
  final VoidCallback onClose;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 250),
      child: Dialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: AppColors.transparent,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE.r),
          side: BorderSide(color: context.clinicBorder),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OperationFormHeader(isEditing: isEditing, onClose: onClose),
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
                  child: OperationFormFields(
                    controller: controller,
                    isEditing: isEditing,
                  ),
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
              child: OperationFormFooter(
                isEditing: isEditing,
                onCancel: onClose,
                onSave: onSave,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
