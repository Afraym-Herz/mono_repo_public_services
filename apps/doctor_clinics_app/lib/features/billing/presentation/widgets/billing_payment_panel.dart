import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/billing/presentation/cubit/record_payment_cubit.dart';

import 'package:doctor_clinics_app/core/finance/widgets/finance_error_state.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_form_header.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_loading_state.dart';
import 'billing_payment_form.dart';

/// Hosts the record-payment states inside the shared billing modal chrome.
class BillingPaymentPanel extends StatelessWidget {
  const BillingPaymentPanel({super.key, required this.invoiceId});

  final int invoiceId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecordPaymentCubit, RecordPaymentState>(
      listenWhen: (previous, current) =>
          previous.saved != current.saved || previous.error != current.error,
      listener: (context, state) {
        if (state.saved != null) {
          context.pop(true);
        } else if (state.error != null) {
          AppSnackBar.showError(context, state.error!);
          context.read<RecordPaymentCubit>().clearError();
        }
      },
      child: Column(
        children: [
          FinanceFormHeader(
            icon: Icons.add_card_outlined,
            titleKey: 'billing.payment.title',
            subtitleKey: 'billing.payment.subtitle',
            onClose: () => context.pop(),
          ),
          Expanded(
            child: BlocBuilder<RecordPaymentCubit, RecordPaymentState>(
              builder: (context, state) {
                final detail = state.detail;
                if (detail != null) {
                  return BillingPaymentForm(
                    detail: detail,
                    saving: state.saving,
                  );
                }
                return state.loading
                    ? const FinanceLoadingState()
                    : FinanceErrorState(
                        messageKey: state.error ?? 'billing.error.load',
                        onRetry: () =>
                            context.read<RecordPaymentCubit>().load(invoiceId),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
