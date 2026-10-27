import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expenses_toolbar_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/helpers/expenses_section.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/widgets/new_expense_dialog.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/widgets/new_purchase_dialog.dart';

import 'expenses_header.dart';
import 'expenses_header_actions.dart';

/// [ExpensesHeader] wired to export and the outflow creation flows.
class ExpensesHeaderConnected extends StatelessWidget {
  const ExpensesHeaderConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpensesHeader(
      onExport: () => AppSnackBar.showInfo(
        context,
        'billing.action.export_unavailable'.tr(),
      ),
      onCreate: (action) => _create(context, action),
    );
  }

  Future<void> _create(
    BuildContext context,
    ExpensesCreateAction action,
  ) async {
    switch (action) {
      case ExpensesCreateAction.expense:
        final expense = await showNewExpenseDialog(context);
        if (expense == null || !context.mounted) return;
        AppSnackBar.showSuccess(context, 'billing.expense_form.saved'.tr());
        _finish(context, ExpensesSection.expenses);
      case ExpensesCreateAction.purchase:
        final purchase = await showNewPurchaseDialog(context);
        if (purchase == null || !context.mounted) return;
        AppSnackBar.showSuccess(context, 'billing.purchase_form.saved'.tr());
        _finish(context, ExpensesSection.purchases);
    }
  }

  void _finish(BuildContext context, ExpensesSection section) {
    context.read<ExpensesToolbarCubit>().sectionChanged(section);
    context.read<ExpensesCubit>().refresh();
  }
}
