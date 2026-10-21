import 'package:core/core.dart';

/// Scheduling is secretary-owned. Falls back to `true` only when auth is not
/// available yet (startup), so the UI does not lock itself out.
bool canManageSchedule() {
  try {
    return getIt<AppAuthCubit>().state.maybeMap(
      authenticated: (s) => s.user.role == AppConstants.userRoleSecretary,
      orElse: () => false,
    );
  } catch (_) {
    return true;
  }
}
