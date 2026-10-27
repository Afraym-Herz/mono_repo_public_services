import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expense_form_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/widgets/expense_panel.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_modal_shell.dart';

/// Views and edits one clinic expense.
class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key, required this.expenseId});

  final int expenseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ExpenseFormCubit>()..load(expenseId),
      child: FinanceModalShell(
        maxWidth: Dimensions.BILLING_FORM_MAX_WIDTH,
        child: ExpensePanel(expenseId: expenseId),
      ),
    );
  }
}
