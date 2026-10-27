import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expenses_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/cubit/expenses_toolbar_cubit.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/widgets/expenses_header_connected.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/widgets/expenses_tab_body.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/widgets/expenses_tabs.dart';
import 'package:doctor_clinics_app/features/expenses/presentation/widgets/expenses_toolbar.dart';

/// Expenses and supplier dashboard: clinic spending and purchase bills.
class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ExpensesCubit>()..load()),
        BlocProvider(create: (_) => getIt<ExpensesToolbarCubit>()),
      ],
      child: AdaptiveLayout(
        mobileLayout: (_) => const _ExpensesBody(),
        tabletLayout: (_) => const _ExpensesBody(),
        desktopLayout: (_) => const _ExpensesBody(),
      ),
    );
  }
}

class _ExpensesBody extends StatelessWidget {
  const _ExpensesBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpensesToolbarCubit, ExpensesToolbarState>(
      listenWhen: (previous, current) => previous.range != current.range,
      listener: (context, state) =>
          context.read<ExpensesCubit>().load(range: state.range),
      child: Scaffold(
        backgroundColor: context.clinicBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            ExpensesHeaderConnected(),
            ExpensesToolbar(),
            ExpensesTabs(),
            Expanded(child: ExpensesTabBody()),
          ],
        ),
      ),
    );
  }
}
