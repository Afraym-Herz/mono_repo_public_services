import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_invoice_detail.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';

import 'billing_detail_row.dart';

/// Invoice facts shown above the record-payment form.
class BillingPaymentSummary extends StatelessWidget {
  const BillingPaymentSummary({super.key, required this.detail});

  final BillingInvoiceDetail detail;

  @override
  Widget build(BuildContext context) {
    final invoice = detail.invoice;
    return AppSectionCard(
      title: 'billing.payment.invoice'.tr(),
      icon: Icons.receipt_long_outlined,
      animationDelay: const Duration(milliseconds: 350),
      child: Column(
        children: [
          BillingDetailRow(
            label: 'billing.invoice_detail.number'.tr(),
            value: invoice.invoiceNumber,
          ),
          BillingDetailRow(
            label: 'billing.invoice_detail.party'.tr(),
            value: detail.partyName.isEmpty
                ? 'billing.value.none'.tr()
                : detail.partyName,
          ),
          BillingDetailRow(
            label: 'billing.invoice_form.total'.tr(),
            value: FinanceFormat.money(invoice.totalPiasters, context),
          ),
          BillingDetailRow(
            label: 'billing.invoice_form.paid'.tr(),
            value: FinanceFormat.money(detail.paidPiasters, context),
            valueColor: context.clinicStatusDone,
          ),
          BillingDetailRow(
            label: 'billing.invoice_form.due'.tr(),
            value: FinanceFormat.money(detail.duePiasters, context),
            valueColor: context.clinicStatusWaiting,
          ),
        ],
      ),
    );
  }
}
