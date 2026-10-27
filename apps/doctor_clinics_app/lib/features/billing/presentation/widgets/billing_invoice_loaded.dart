import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_invoice_detail.dart';
import 'package:doctor_clinics_app/core/finance/domain/form_totals.dart';

import 'billing_invoice_footer.dart';
import 'billing_invoice_items_card.dart';
import 'billing_invoice_payments_card.dart';
import 'billing_invoice_summary.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_totals_card.dart';

/// Scrollable body of the invoice detail modal.
class BillingInvoiceLoaded extends StatelessWidget {
  const BillingInvoiceLoaded({
    super.key,
    required this.invoiceId,
    required this.detail,
  });

  final int invoiceId;
  final BillingInvoiceDetail detail;

  @override
  Widget build(BuildContext context) {
    final invoice = detail.invoice;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BillingInvoiceSummary(detail: detail),
                BillingInvoiceItemsCard(items: detail.items),
                FinanceTotalsCard(
                  totals: FinanceFormTotals(
                    subtotal: detail.subtotalPiasters,
                    discount: invoice.discountPiasters,
                    total: invoice.totalPiasters,
                    paid: detail.paidPiasters,
                    due: detail.duePiasters,
                    status: detail.status,
                  ),
                ),
                if (detail.payments.isNotEmpty)
                  BillingInvoicePaymentsCard(payments: detail.payments),
              ],
            ),
          ),
        ),
        BillingInvoiceFooter(invoiceId: invoiceId, detail: detail),
      ],
    );
  }
}
