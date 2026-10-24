import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/purchase_form_controller.dart';
import 'billing_form_header.dart';
import 'new_purchase_footer.dart';
import 'new_purchase_form.dart';

/// Dialog shell for the supplier-bill form.
class NewPurchaseView extends StatelessWidget {
  const NewPurchaseView({
    super.key,
    required this.controller,
    required this.onClose,
    required this.onSave,
  });

  final PurchaseFormController controller;
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
            BillingFormHeader(
              icon: Icons.shopping_bag_outlined,
              titleKey: 'billing.purchase_form.title',
              subtitleKey: 'billing.purchase_form.subtitle',
              onClose: onClose,
            ),
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
                  child: NewPurchaseForm(controller: controller),
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
              child: NewPurchaseFooter(
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
