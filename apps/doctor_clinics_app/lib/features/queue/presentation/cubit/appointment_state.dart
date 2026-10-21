part of 'appointment_cubit.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const factory AppointmentState.initial() = _Initial;
  const factory AppointmentState.loading() = _Loading;
  const factory AppointmentState.loaded({
    required AppointmentViewMode mode,
    required DateTime anchorDate,
    required List<AppointmentListItem> appointments,
    @Default(0) int todayCount,
    @Default(0) int weekCount,
    @Default(false) bool isSubmitting,
    String? actionError,
  }) = _Loaded;
  const factory AppointmentState.error({required String message}) = _Error;
}

extension AppointmentStateX on AppointmentState {
  List<AppointmentListItem> get items => maybeMap(
    loaded: (s) => s.appointments,
    orElse: () => const <AppointmentListItem>[],
  );

  AppointmentViewMode get mode =>
      maybeMap(loaded: (s) => s.mode, orElse: () => AppointmentViewMode.day);

  String? get actionError =>
      maybeMap(loaded: (s) => s.actionError, orElse: () => null);
}
