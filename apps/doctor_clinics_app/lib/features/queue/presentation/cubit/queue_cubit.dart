import 'dart:math' as math;
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/booked_appointment.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_status.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import 'package:doctor_clinics_app/features/queue/domain/repositories/queue_repository.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/queue_list_filter.dart';
import 'package:doctor_clinics_app/features/queue/presentation/helpers/queue_sort_order.dart';
import 'package:doctor_clinics_app/features/settings/domain/repositories/settings_repository.dart';

part 'queue_state.dart';
part 'queue_cubit.freezed.dart';

class QueueCubit extends Cubit<QueueState> {
  final IQueueRepository repository;
  final ISettingsRepository settingsRepository;

  QueueCubit({required this.repository, required this.settingsRepository})
      : super(const QueueState.initial());

  Future<void> loadTodayQueue() async {
    final previous = state;
    emit(const QueueState.loading());
    final boardResult = await repository.getTodayBoard();
    if (boardResult.isLeft()) {
      emit(QueueState.error(
        message: boardResult.fold((f) => f.message, (_) => ''),
      ));
      return;
    }
    final templateResult = await settingsRepository.getClinicTemplate();
    final template = templateResult.fold((_) => null, (t) => t);
    final board = boardResult.fold((_) => null, (b) => b)!;
    emit(QueueState.loaded(
      tickets: board.tickets,
      booked: board.booked,
      filter: previous.listFilter,
      sortOrder: previous.listSortOrder,
      defaultFeePiasters: template?.defaultConsultationFeePiasters ?? 0,
      doctorNameAr: template?.doctorNameAr ?? '',
      doctorNameEn: template?.doctorNameEn ?? '',
    ));
  }

  Future<void> refresh() async {
    final cur = state;
    cur is _Loaded ? await _reloadSilently(cur) : await loadTodayQueue();
  }

  void updateListSelection({QueueListFilter? filter, QueueSortOrder? sortOrder}) =>
      emit(state.withListSelection(filter: filter, sortOrder: sortOrder));

  void clearActionError() {
    final cur = state;
    if (cur is _Loaded) emit(cur.copyWith(actionError: null));
  }

  Future<void> checkIn(int id) => _runAction(() => repository.checkIn(id));
  Future<void> addWalkIn(int id) => _runAction(() => repository.addWalkIn(id));
  Future<void> call(int id) => _runAction(() => repository.callEntry(id));
  Future<void> finish(int id) => _runAction(() => repository.finishEntry(id));
  Future<void> cancel(int id, {String? reason}) =>
      _runAction(() => repository.cancelEntry(id, reason: reason));
  Future<void> cancelAppointment(int id, String reason) =>
      _runAction(() => repository.cancelAppointment(id, reason));
  Future<void> restore(int id) => _runAction(() => repository.restoreEntry(id));
  Future<void> collect(int id, int amount) =>
      _runAction(() => repository.collectEntry(id, amount));
  Future<void> advance(int id) => _runAction(() => repository.advanceEntry(id));
  Future<void> toggleUrgent(int id, bool val) =>
      _runAction(() => repository.setUrgent(id, val));

  Future<void> reorderWaiting(int oldIndex, int newIndex) async {
    final loaded = state.maybeMap(loaded: (s) => s, orElse: () => null);
    if (loaded == null) return;
    final ascending = loaded.waitingGroup;
    final waiting = loaded.sortOrder == QueueSortOrder.ticketDescending
        ? ascending.reversed.toList()
        : ascending;
    if (oldIndex < 0 || oldIndex >= waiting.length || newIndex < 0 || newIndex >= waiting.length) return;
    final moved = [...waiting];
    moved.insert(newIndex, moved.removeAt(oldIndex));
    final base = loaded.tickets
        .where((t) => t.status == QueueStatus.inConsultation || t.isUrgent)
        .fold<int>(0, (m, t) => math.max(m, t.position));
    final reordered = [
      for (var i = 0; i < moved.length; i++) moved[i].copyWith(position: base + i + 1),
    ];
    emit(loaded.copyWith(
      tickets: loaded.replaceWaiting(reordered),
      sortOrder: QueueSortOrder.ticketAscending,
      actionError: null,
    ));
    final result = await repository.reorderWaiting(reordered.map((t) => t.entryId).toList());
    result.fold((f) {
      emit(loaded.copyWith(actionError: f.message));
      _reloadSilently(loaded);
    }, (_) {});
  }

  Future<void> _runAction(FutureResult<void> Function() run) async {
    final current = state;
    if (current is! _Loaded) return;
    emit(current.copyWith(isSubmitting: true, actionError: null));
    final result = await run();
    result.fold(
      (f) => emit(current.copyWith(isSubmitting: false, actionError: f.message)),
      (_) => _reloadSilently(current),
    );
  }

  Future<void> _reloadSilently(_Loaded previous) async {
    final board = await repository.getTodayBoard();
    board.fold(
      (f) => emit(previous.copyWith(isSubmitting: false, actionError: f.message)),
      (b) => emit(previous.copyWith(
        tickets: b.tickets,
        booked: b.booked,
        isSubmitting: false,
        actionError: null,
      )),
    );
  }
}