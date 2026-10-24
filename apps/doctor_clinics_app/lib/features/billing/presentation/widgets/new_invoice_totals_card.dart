import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/billing_format.dart';
import '../helpers/invoice_form_controller.dart';
import 'billing_status_pill.dart';
import 'new_invoice_total_row.dart';

/// Live subtotal/discount/total/paid/due summary of the invoice form.
class NewInvoiceTotalsCard extends StatelessWidget {
  const NewInvoiceTotalsCard({super.key, required this.controller});

  final InvoiceFormController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: controller.revision,
      builder: (context, _, _) {
        final totals = controller.totals;
        return Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
          decoration: BoxDecoration(
            color: context.clinicContainer,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
            border: Border.all(color: context.clinicBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NewInvoiceTotalRow(
                label: 'billing.invoice_form.subtotal'.tr(),
                value: BillingFormat.money(totals.subtotal, context),
              ),
              if (totals.discount > 0)
                NewInvoiceTotalRow(
                  label: 'billing.invoice_form.discount'.tr(),
                  value: '- ${BillingFormat.money(totals.discount, context)}',
                  color: context.clinicStatusCancelled,
                ),
              NewInvoiceTotalRow(
                label: 'billing.invoice_form.total'.tr(),
                value: BillingFormat.money(totals.total, context),
                emphasized: true,
              ),
              if (totals.paid > 0)
                NewInvoiceTotalRow(
                  label: 'billing.invoice_form.paid'.tr(),
                  value: BillingFormat.money(totals.paid, context),
                  color: context.clinicStatusDone,
                ),
              NewInvoiceTotalRow(
                label: 'billing.invoice_form.due'.tr(),
                value: BillingFormat.money(totals.due, context),
                emphasized: true,
                color: totals.due > 0
                    ? context.clinicStatusWaiting
                    : context.clinicStatusDone,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: BillingStatusPill(status: totals.status),
              ),
            ],
          ),
        );
      },
    );
  }
}
