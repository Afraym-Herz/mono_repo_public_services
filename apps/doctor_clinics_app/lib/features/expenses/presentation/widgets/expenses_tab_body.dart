import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/core/finance/widgets/finance_error_state.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_loading_state.dart';

import '../cubit/expenses_cubit.dart';
import '../cubit/expenses_toolbar_cubit.dart';
import '../helpers/expenses_section.dart';
import 'expenses_tab.dart';
import 'purchases_tab.dart';

/// Resolves the loading/error/loaded state and the active expenses section.
class ExpensesTabBody extends StatelessWidget {
  const ExpensesTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExpensesCubit>();
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) => state.maybeWhen(
        loaded: (overview) =>
            BlocBuilder<ExpensesToolbarCubit, ExpensesToolbarState>(
              buildWhen: (previous, current) =>
                  previous.section != current.section ||
                  previous.query != current.query,
              builder: (context, toolbar) => switch (toolbar.section) {
                ExpensesSection.expenses => ExpensesTab(
                  overview: overview,
                  query: toolbar.query,
                ),
                ExpensesSection.purchases => PurchasesTab(
                  overview: overview,
                  query: toolbar.query,
                ),
              },
            ),
        error: (message) =>
            FinanceErrorState(messageKey: message, onRetry: cubit.refresh),
        orElse: () => const FinanceLoadingState(),
      ),
    );
  }
}
