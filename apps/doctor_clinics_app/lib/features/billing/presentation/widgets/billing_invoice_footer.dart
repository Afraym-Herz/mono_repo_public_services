import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_invoice_detail.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/invoice_detail_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/open_billing_modal.dart';

/// Close and record-payment actions for the invoice detail modal.
class BillingInvoiceFooter extends StatelessWidget {
  const BillingInvoiceFooter({
    super.key,
    required this.invoiceId,
    required this.detail,
  });

  final int invoiceId;
  final BillingInvoiceDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: context.clinicBorder)),
      ),
      child: Wrap(
        spacing: Dimensions.PADDING_SIZE_SMALL.w,
        runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
        alignment: WrapAlignment.end,
        children: [
          AppPillButton(
            icon: Icons.close_rounded,
            label: 'billing.invoice_detail.close'.tr(),
            outlined: true,
            onTap: () => context.pop(),
          ),
          if (detail.canRecordPayment)
            AppPillButton(
              icon: Icons.add_card_outlined,
              label: 'billing.invoice_detail.record_payment'.tr(),
              primary: true,
              onTap: () => _record(context),
            ),
        ],
      ),
    );
  }

  Future<void> _record(BuildContext context) async {
    final saved = await openBillingPayment(context, invoiceId);
    if (saved && context.mounted) {
      context.read<InvoiceDetailCubit>().load(invoiceId);
    }
  }
}
