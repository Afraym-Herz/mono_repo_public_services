import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_invoice_detail.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';

import 'billing_detail_row.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_status_pill.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_type_pill.dart';

/// Invoice header facts shown at the top of the detail modal.
class BillingInvoiceSummary extends StatelessWidget {
  const BillingInvoiceSummary({super.key, required this.detail});

  final BillingInvoiceDetail detail;

  @override
  Widget build(BuildContext context) {
    final invoice = detail.invoice;
    final party = detail.partyName.isEmpty
        ? 'billing.value.none'.tr()
        : detail.partyName;
    return AppSectionCard(
      title: 'billing.invoice_detail.summary'.tr(),
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
            value: party,
          ),
          BillingDetailRow(
            label: 'billing.invoice_detail.date'.tr(),
            value: FinanceFormat.date(invoice.invoiceDate, context),
          ),
          BillingDetailRow(
            label: 'billing.invoice_detail.type'.tr(),
            valueWidget: FinanceTypePill(type: invoice.type),
          ),
          BillingDetailRow(
            label: 'billing.invoice_detail.status'.tr(),
            valueWidget: FinanceStatusPill(status: detail.status),
          ),
        ],
      ),
    );
  }
}
