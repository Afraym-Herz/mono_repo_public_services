import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/billing/presentation/cubit/record_payment_cubit.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_modal_shell.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/billing_payment_panel.dart';

/// Records a payment against one invoice.
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.invoiceId});

  final int invoiceId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RecordPaymentCubit>()..load(invoiceId),
      child: FinanceModalShell(
        maxWidth: Dimensions.BILLING_FORM_MAX_WIDTH,
        child: BillingPaymentPanel(invoiceId: invoiceId),
      ),
    );
  }
}
