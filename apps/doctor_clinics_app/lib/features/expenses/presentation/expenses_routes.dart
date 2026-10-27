import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import 'screens/expense_screen.dart';

/// Expenses detail/form modals (outside the shell) — see CLAUDE.md §5.
///
/// Siblings of `Routes.expenses` so the expenses dashboard stays visible behind
/// the scrim when one of these modals is pushed.
List<RouteBase> buildExpensesRoutes() {
  return [
    GoRoute(
      path: '${Routes.expenses}/expenses/:expenseId',
      name: Routes.routeExpensesExpense,
      pageBuilder: (context, state) => transparentModalRoutePage(
        ExpenseScreen(expenseId: _id(state.pathParameters['expenseId'])),
      ),
    ),
  ];
}

int _id(String? value) => int.tryParse(value ?? '') ?? 0;
