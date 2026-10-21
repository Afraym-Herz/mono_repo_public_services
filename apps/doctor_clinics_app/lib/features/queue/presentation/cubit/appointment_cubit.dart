import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_calendar.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/appointment_header_counts.dart';

part 'appointment_state.dart';
part 'appointment_actions.dart';
part 'appointment_cubit.freezed.dart';

/// Day/Week/Month appointment planner. Bookings are day-only; the queue number
/// is assigned by the repository as `max + 1` for the selected day.
class AppointmentCubit extends Cubit<AppointmentState> with AppointmentActions {
  @override
  final IQueueRepository repository;

  AppointmentCubit({required this.repository})
    : super(const AppointmentState.initial());

  /// Ignores the result of an older load when the user changes day/week again
  /// before the first query returns.
  int _loadToken = 0;

  /// Last requested view. Kept outside the emitted state so navigation still
  /// works while a load is in flight (the loading state has no anchor).
  AppointmentViewMode _mode = AppointmentViewMode.day;
  DateTime _anchorDate = AppointmentCalendar.dayOf(DateTime.now());

  @override
  Future<void> load({AppointmentViewMode? mode, DateTime? anchor}) async {
    final token = ++_loadToken;
    final nextMode = mode ?? _mode;
    final nextAnchor = AppointmentCalendar.dayOf(anchor ?? _anchorDate);
    _mode = nextMode;
    _anchorDate = nextAnchor;
    emit(const AppointmentState.loading());
    final (start, end) = AppointmentCalendar.rangeFor(nextMode, nextAnchor);
    final result = await repository.getAppointmentsInRange(start, end);
    final counts = await AppointmentHeaderCounts.load(repository);
    if (isClosed || token != _loadToken) return;
    result.fold(
      (f) => emit(AppointmentState.error(message: f.message)),
      (items) => emit(
        AppointmentState.loaded(
          mode: nextMode,
          anchorDate: nextAnchor,
          appointments: items,
          todayCount: counts.$1,
          weekCount: counts.$2,
        ),
      ),
    );
  }

  Future<void> refresh() => load();

  Future<void> setMode(AppointmentViewMode mode) => load(mode: mode);

  Future<void> move(int delta) async {
    final target = switch (_mode) {
      AppointmentViewMode.day => DateTime(
        _anchorDate.year,
        _anchorDate.month,
        _anchorDate.day + delta,
      ),
      AppointmentViewMode.week => DateTime(
        _anchorDate.year,
        _anchorDate.month,
        _anchorDate.day + delta * 7,
      ),
      AppointmentViewMode.month => AppointmentCalendar.monthAnchor(
        _anchorDate,
        delta,
      ),
    };
    await load(anchor: target);
  }

  Future<void> goToday() => load(anchor: DateTime.now());
}
