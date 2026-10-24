import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/billing/presentation/cubit/billing_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/billing_toolbar_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/billing_header_connected.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/billing_tab_body.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/billing_tabs.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/billing_toolbar.dart';

/// Accounts and revenue dashboard: invoices, payments, expenses and reports.
class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<BillingCubit>()..load()),
        BlocProvider(create: (_) => getIt<BillingToolbarCubit>()),
      ],
      child: AdaptiveLayout(
        mobileLayout: (_) => const _BillingBody(),
        tabletLayout: (_) => const _BillingBody(),
        desktopLayout: (_) => const _BillingBody(),
      ),
    );
  }
}

class _BillingBody extends StatelessWidget {
  const _BillingBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<BillingToolbarCubit, BillingToolbarState>(
      listenWhen: (previous, current) => previous.range != current.range,
      listener: (context, state) =>
          context.read<BillingCubit>().load(range: state.range),
      child: Scaffold(
        backgroundColor: context.clinicBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            BillingHeaderConnected(),
            BillingToolbar(),
            BillingTabs(),
            Expanded(child: BillingTabBody()),
          ],
        ),
      ),
    );
  }
}
