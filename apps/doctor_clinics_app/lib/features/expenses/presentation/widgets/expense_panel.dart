import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expense_form_cubit.dart';

import 'package:doctor_clinics_app/core/finance/widgets/finance_error_state.dart';
import 'expense_form.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_form_header.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_loading_state.dart';

/// Hosts the expense editor states inside the shared billing modal chrome.
class ExpensePanel extends StatelessWidget {
  const ExpensePanel({super.key, required this.expenseId});

  final int expenseId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpenseFormCubit, ExpenseFormState>(
      listenWhen: (previous, current) =>
          previous.saved != current.saved || previous.error != current.error,
      listener: (context, state) {
        if (state.saved) {
          context.pop(true);
        } else if (state.error != null) {
          AppSnackBar.showError(context, state.error!);
          context.read<ExpenseFormCubit>().clearError();
        }
      },
      child: Column(
        children: [
          FinanceFormHeader(
            icon: Icons.account_balance_wallet_outlined,
            titleKey: 'billing.expense_form.edit_title',
            subtitleKey: 'billing.expense_form.edit_subtitle',
            onClose: () => context.pop(),
          ),
          Expanded(
            child: BlocBuilder<ExpenseFormCubit, ExpenseFormState>(
              builder: (context, state) {
                final expense = state.expense;
                if (expense != null) {
                  return ExpenseForm(
                    expense: expense,
                    categories: state.categories,
                    saving: state.saving,
                  );
                }
                return state.loading
                    ? const FinanceLoadingState()
                    : FinanceErrorState(
                        messageKey: state.error ?? 'billing.error.load',
                        onRetry: () =>
                            context.read<ExpenseFormCubit>().load(expenseId),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
