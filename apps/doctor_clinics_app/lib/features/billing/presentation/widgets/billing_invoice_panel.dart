import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/billing/presentation/cubit/invoice_detail_cubit.dart';

import 'package:doctor_clinics_app/core/finance/widgets/finance_error_state.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_form_header.dart';
import 'billing_invoice_loaded.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_loading_state.dart';

/// Hosts the invoice detail states inside the shared billing modal chrome.
class BillingInvoicePanel extends StatelessWidget {
  const BillingInvoicePanel({super.key, required this.invoiceId});

  final int invoiceId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FinanceFormHeader(
          icon: Icons.receipt_long_outlined,
          titleKey: 'billing.invoice_detail.title',
          subtitleKey: 'billing.invoice_detail.subtitle',
          onClose: () => context.pop(),
        ),
        Expanded(
          child: BlocBuilder<InvoiceDetailCubit, InvoiceDetailState>(
            builder: (context, state) => state.maybeMap(
              loaded: (loaded) => BillingInvoiceLoaded(
                invoiceId: invoiceId,
                detail: loaded.detail,
              ),
              error: (error) => FinanceErrorState(
                messageKey: error.message,
                onRetry: () =>
                    context.read<InvoiceDetailCubit>().load(invoiceId),
              ),
              orElse: () => const FinanceLoadingState(),
            ),
          ),
        ),
      ],
    );
  }
}
