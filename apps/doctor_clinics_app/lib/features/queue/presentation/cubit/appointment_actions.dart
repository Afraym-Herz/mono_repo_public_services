part of 'appointment_cubit.dart';

mixin AppointmentActions on Cubit<AppointmentState> {
  IQueueRepository get repository;

  Future<void> load({AppointmentViewMode? mode, DateTime? anchor});

  Future<void> book({
    required int patientId,
    required DateTime date,
    String type = AppConstants.appointmentTypeBooked,
    String? reason,
    String? notes,
  }) => _runAction(() {
    final now = DateTime.now();
    return repository.bookAppointment(
      Appointment(
        id: 0,
        patientId: patientId,
        scheduledDate: date,
        scheduledTime: '',
        type: type,
        status: AppConstants.appointmentStatusBooked,
        reason: reason,
        notes: notes,
        createdBy: _currentUserId(),
        createdAt: now,
        updatedAt: now,
      ),
    );
  }, anchor: date);

  Future<void> cancel(int appointmentId) => _runAction(
    () => repository.cancelAppointment(
      appointmentId,
      AppConstants.queueCancelReasonStaff,
    ),
  );

  Future<void> reschedule(int appointmentId, DateTime newDate) => _runAction(
    () => repository.rescheduleAppointment(appointmentId, newDate),
  );

  void clearActionError() {
    final current = state;
    if (current is _Loaded) emit(current.copyWith(actionError: null));
  }

  int _currentUserId() {
    final auth = getIt<AppAuthCubit>().state;
    return auth.maybeMap(
      authenticated: (s) => int.tryParse(s.user.id) ?? 0,
      orElse: () => 0,
    );
  }

  /// Runs a planner mutation and reloads the affected period. A supplied
  /// [anchor] jumps to that day, so a new booking is visible in its own day
  /// (at the end of the queue) instead of staying on the previously viewed one.
  Future<void> _runAction(
    FutureResult<Object?> Function() run, {
    DateTime? anchor,
  }) async {
    final current = state;
    if (current is! _Loaded || current.isSubmitting) return;
    emit(current.copyWith(isSubmitting: true, actionError: null));
    final result = await run();
    if (isClosed) return;
    result.fold(
      (f) =>
          emit(current.copyWith(isSubmitting: false, actionError: f.message)),
      (_) => anchor == null
          ? load()
          : load(mode: AppointmentViewMode.day, anchor: anchor),
    );
  }
}
