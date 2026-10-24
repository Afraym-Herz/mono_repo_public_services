import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_view.dart';

/// Centers the operation form at the modal's maximum size.
class OperationFormCentered extends StatelessWidget {
  const OperationFormCentered({
    super.key,
    required this.controller,
    required this.onClose,
    required this.onSave,
  });

  final OperationFormController controller;
  final VoidCallback onClose;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 620.w,
            maxHeight:
                MediaQuery.sizeOf(context).height *
                Dimensions.MODAL_MAX_HEIGHT_FACTOR,
          ),
          child: OperationFormView(
            controller: controller,
            onClose: onClose,
            onSave: onSave,
          ),
        ),
      ),
    );
  }
}
