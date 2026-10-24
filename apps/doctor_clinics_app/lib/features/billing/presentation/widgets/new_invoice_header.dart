import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/invoice_form_controller.dart';

/// Header of the new-invoice / sale modal, matching the patient form chrome.
class NewInvoiceHeader extends StatelessWidget {
  const NewInvoiceHeader({super.key, required this.onClose, required this.mode});

  final VoidCallback onClose;
  final InvoiceFormMode mode;

  @override
  Widget build(BuildContext context) {
    final isPatient = mode == InvoiceFormMode.patient;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Dimensions.PADDING_SIZE_LARGE.w,
        Dimensions.PADDING_SIZE_LARGE.h,
        Dimensions.PADDING_SIZE_SMALL.w,
        Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: Row(
        children: [
          Container(
            width: Dimensions.ICON_SIZE_LARGE.r * 1.4,
            height: Dimensions.ICON_SIZE_LARGE.r * 1.4,
            decoration: BoxDecoration(
              color: context.clinicContainer,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
              border: Border.all(color: context.clinicBorder),
            ),
            child: Icon(
              isPatient
                  ? Icons.receipt_long_outlined
                  : Icons.point_of_sale_outlined,
              size: Dimensions.ICON_SIZE_DEFAULT.r,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (isPatient
                          ? 'billing.invoice_form.title'
                          : 'billing.invoice_form.sale_title')
                      .tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.clinicTextPrimary,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
                Text(
                  (isPatient
                          ? 'billing.invoice_form.subtitle'
                          : 'billing.invoice_form.sale_subtitle')
                      .tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: context.clinicTextSecondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onClose,
            tooltip: 'billing.invoice_form.close'.tr(),
            icon: const Icon(Icons.close_rounded),
          ),
        ],
      ),
    );
  }
}
