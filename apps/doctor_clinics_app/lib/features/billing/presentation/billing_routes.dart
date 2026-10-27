import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import 'screens/invoice_screen.dart';
import 'screens/payment_screen.dart';

/// Billing detail/form modals (outside the shell) — see CLAUDE.md §5.
///
/// Siblings of `Routes.billing` so the accounts dashboard stays visible behind
/// the scrim when one of these modals is pushed.
List<RouteBase> buildBillingRoutes() {
  return [
    GoRoute(
      path: '${Routes.billing}/invoices/:invoiceId',
      name: Routes.routeBillingInvoice,
      pageBuilder: (context, state) => transparentModalRoutePage(
        InvoiceScreen(invoiceId: _id(state.pathParameters['invoiceId'])),
      ),
    ),
    GoRoute(
      path: '${Routes.billing}/invoices/:invoiceId/payment',
      name: Routes.routeBillingPayment,
      pageBuilder: (context, state) => transparentModalRoutePage(
        PaymentScreen(invoiceId: _id(state.pathParameters['invoiceId'])),
      ),
    ),
  ];
}

int _id(String? value) => int.tryParse(value ?? '') ?? 0;
