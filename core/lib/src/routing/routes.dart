class Routes {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  // Primary navigation destinations (right-hand nav pane).
  static const String queue = '/queue';
  static const String appointments = '/appointments';
  static const String patients = '/patients';
  static const String operations = '/operations';
  static const String billing = '/billing';
  static const String expenses = '/expenses';

  /// Quick-settings modal (language + theme), pushed outside the shell.
  static const String settings = '/settings';

  // ═══════════════════════════════════════════════════════════════
  // Route names (for GoRouter `name:` param / `context.goNamed()`).
  // ═══════════════════════════════════════════════════════════════
  static const String routeQueue = 'queue';
  static const String routeAppointments = 'appointments';
  static const String routePatients = 'patients';
  static const String routeOperations = 'operations';
  static const String routeBilling = 'billing';
  static const String routeExpenses = 'expenses';
  static const String routeSettings = 'settings';
  static const String routePatientProfile = 'patient-profile';
  static const String routeBillingInvoice = 'billing-invoice';
  static const String routeBillingPayment = 'billing-payment';
  static const String routeExpensesExpense = 'expenses-expense';
}
