import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/billing/presentation/cubit/billing_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/cubit/billing_toolbar_cubit.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/billing_tab.dart';
import 'package:doctor_clinics_app/features/billing/presentation/helpers/invoice_form_controller.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/new_expense_dialog.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/new_invoice_dialog.dart';
import 'package:doctor_clinics_app/features/billing/presentation/widgets/new_purchase_dialog.dart';

import 'billing_header.dart';
import 'billing_header_actions.dart';

/// [BillingHeader] wired to export and every document creation flow.
class BillingHeaderConnected extends StatelessWidget {
  const BillingHeaderConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return BillingHeader(
      onExport: () => AppSnackBar.showInfo(
        context,
        'billing.action.export_unavailable'.tr(),
      ),
      onCreate: (action) => _create(context, action),
    );
  }

  Future<void> _create(BuildContext context, BillingCreateAction action) async {
    switch (action) {
      case BillingCreateAction.invoice:
        final invoice = await showNewInvoiceDialog(context);
        if (invoice == null || !context.mounted) return;
        AppSnackBar.showSuccess(context, 'billing.invoice_form.saved'.tr());
        _finish(context, BillingTab.summary);
      case BillingCreateAction.sale:
        final invoice = await showNewInvoiceDialog(
          context,
          mode: InvoiceFormMode.nonPatient,
        );
        if (invoice == null || !context.mounted) return;
        AppSnackBar.showSuccess(
          context,
          'billing.invoice_form.sale_saved'.tr(),
        );
        _finish(context, BillingTab.summary);
      case BillingCreateAction.purchase:
        final purchase = await showNewPurchaseDialog(context);
        if (purchase == null || !context.mounted) return;
        AppSnackBar.showSuccess(context, 'billing.purchase_form.saved'.tr());
        _finish(context, BillingTab.purchases);
      case BillingCreateAction.expense:
        final expense = await showNewExpenseDialog(context);
        if (expense == null || !context.mounted) return;
        AppSnackBar.showSuccess(context, 'billing.expense_form.saved'.tr());
        _finish(context, BillingTab.expenses);
    }
  }

  void _finish(BuildContext context, BillingTab tab) {
    context.read<BillingToolbarCubit>().tabChanged(tab);
    context.read<BillingCubit>().refresh();
  }
}
