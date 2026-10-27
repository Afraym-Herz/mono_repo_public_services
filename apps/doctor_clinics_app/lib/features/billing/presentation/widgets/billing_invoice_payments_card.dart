import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/payment.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';

import 'billing_detail_row.dart';

/// Receipts recorded against one invoice.
class BillingInvoicePaymentsCard extends StatelessWidget {
  const BillingInvoicePaymentsCard({super.key, required this.payments});

  final List<Payment> payments;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'billing.invoice_detail.payments'.tr(),
      icon: Icons.payments_outlined,
      animationDelay: const Duration(milliseconds: 450),
      child: payments.isEmpty
          ? ResponsiveText(
              'billing.invoice_detail.no_payments'.tr(),
              fontSize: Dimensions.FONT_SIZE_SMALL,
              color: context.clinicTextSecondary,
            )
          : Column(
              children: [
                for (final payment in payments)
                  BillingDetailRow(
                    label: _label(payment, context),
                    value: FinanceFormat.money(payment.amountPiasters, context),
                    valueColor: context.clinicStatusDone,
                  ),
              ],
            ),
    );
  }

  String _label(Payment payment, BuildContext context) {
    final date = FinanceFormat.date(payment.paymentDate, context);
    final method = FinanceFormat.paymentMethod(payment.paymentMethod);
    return '${payment.receiptNumber} • $method • $date';
  }
}
