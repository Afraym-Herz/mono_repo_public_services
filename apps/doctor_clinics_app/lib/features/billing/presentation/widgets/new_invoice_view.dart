import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/invoice_form_controller.dart';
import 'new_invoice_footer.dart';
import 'new_invoice_form.dart';
import 'new_invoice_header.dart';

/// Dialog shell for the new-invoice / sale form.
class NewInvoiceView extends StatelessWidget {
  const NewInvoiceView({
    super.key,
    required this.controller,
    required this.mode,
    required this.onClose,
    required this.onSave,
  });

  final InvoiceFormController controller;
  final InvoiceFormMode mode;
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
          maxWidth: 640.w,
          maxHeight:
              MediaQuery.sizeOf(context).height *
              Dimensions.MODAL_MAX_HEIGHT_FACTOR,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NewInvoiceHeader(onClose: onClose, mode: mode),
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
                  child: NewInvoiceForm(controller: controller, mode: mode),
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
              child: NewInvoiceFooter(
                onCancel: onClose,
                onSave: onSave,
                saveLabelKey: mode == InvoiceFormMode.patient
                    ? 'billing.invoice_form.save'
                    : 'billing.invoice_form.save_sale',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
