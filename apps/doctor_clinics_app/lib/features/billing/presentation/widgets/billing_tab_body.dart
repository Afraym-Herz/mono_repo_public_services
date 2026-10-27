import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/billing_cubit.dart';
import '../cubit/billing_toolbar_cubit.dart';
import '../helpers/billing_tab.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_error_state.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_loading_state.dart';
import 'billing_payments_tab.dart';
import 'billing_report_tab.dart';
import 'billing_summary_tab.dart';

/// Resolves the loading/error/loaded state and the active accounts tab.
class BillingTabBody extends StatelessWidget {
  const BillingTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BillingCubit>();
    return BlocBuilder<BillingCubit, BillingState>(
      builder: (context, state) => state.maybeWhen(
        loaded: (overview) =>
            BlocBuilder<BillingToolbarCubit, BillingToolbarState>(
              buildWhen: (previous, current) =>
                  previous.tab != current.tab ||
                  previous.query != current.query,
              builder: (context, toolbar) => switch (toolbar.tab) {
                BillingTab.summary => BillingSummaryTab(
                  overview: overview,
                  query: toolbar.query,
                ),
                BillingTab.payments => BillingPaymentsTab(
                  overview: overview,
                  query: toolbar.query,
                ),
                BillingTab.report => BillingReportTab(overview: overview),
              },
            ),
        error: (message) =>
            FinanceErrorState(messageKey: message, onRetry: cubit.refresh),
        orElse: () => const FinanceLoadingState(),
      ),
    );
  }
}
