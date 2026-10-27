import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/billing/presentation/cubit/invoice_detail_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/billing_invoice_panel.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_modal_shell.dart';

/// Read-only invoice detail modal with items, receipts and totals.
class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key, required this.invoiceId});

  final int invoiceId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<InvoiceDetailCubit>()..load(invoiceId),
      child: FinanceModalShell(
        child: BillingInvoicePanel(invoiceId: invoiceId),
      ),
    );
  }
}
