import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:doctor_clinics_app/features/billing/presentation/cubit/billing_cubit.dart';

/// Opens the invoice detail modal, then refreshes the accounts dashboard.
Future<void> openBillingInvoice(BuildContext context, int invoiceId) async {
  await context.push<bool>('${Routes.billing}/invoices/$invoiceId');
  if (context.mounted) context.read<BillingCubit>().refresh();
}

/// Opens the record-payment modal and reports whether a receipt was saved.
Future<bool> openBillingPayment(BuildContext context, int invoiceId) async {
  return await context.push<bool>(
        '${Routes.billing}/invoices/$invoiceId/payment',
      ) ??
      false;
}
