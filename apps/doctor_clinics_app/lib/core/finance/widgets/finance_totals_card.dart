import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/finance/domain/form_totals.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_status_pill.dart';
import 'finance_total_row.dart';

/// Live subtotal/discount/total/paid/due summary shared by billing forms.
class FinanceTotalsCard extends StatelessWidget {
  const FinanceTotalsCard({
    super.key,
    required this.totals,
    this.showDiscount = true,
  });

  final FinanceFormTotals totals;
  final bool showDiscount;

  @override
  Widget build(BuildContext context) {
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
          FinanceTotalRow(
            label: 'billing.invoice_form.subtotal'.tr(),
            value: FinanceFormat.money(totals.subtotal, context),
          ),
          if (showDiscount && totals.discount > 0)
            FinanceTotalRow(
              label: 'billing.invoice_form.discount'.tr(),
              value: '- ${FinanceFormat.money(totals.discount, context)}',
              color: context.clinicStatusCancelled,
            ),
          FinanceTotalRow(
            label: 'billing.invoice_form.total'.tr(),
            value: FinanceFormat.money(totals.total, context),
            emphasized: true,
          ),
          if (totals.paid > 0)
            FinanceTotalRow(
              label: 'billing.invoice_form.paid'.tr(),
              value: FinanceFormat.money(totals.paid, context),
              color: context.clinicStatusDone,
            ),
          FinanceTotalRow(
            label: 'billing.invoice_form.due'.tr(),
            value: FinanceFormat.money(totals.due, context),
            emphasized: true,
            color: totals.due > 0
                ? context.clinicStatusWaiting
                : context.clinicStatusDone,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: FinanceStatusPill(status: totals.status),
          ),
        ],
      ),
    );
  }
}
