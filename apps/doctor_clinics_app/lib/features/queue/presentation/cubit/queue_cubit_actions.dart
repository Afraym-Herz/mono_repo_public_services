part of 'queue_cubit.dart';

mixin QueueCubitActions on Cubit<QueueState> {
  IQueueRepository get repository;

  Future<void> loadTodayQueue();

  Future<void> addWalkIn(int id, {String? notes}) =>
      _runAction(() => repository.addWalkIn(id, notes: notes));
  Future<void> call(int id) => _runAction(() => repository.callEntry(id));
  Future<void> finish(int id) => _runAction(() => repository.finishEntry(id));
  Future<void> cancel(int id, {String? reason}) =>
      _runAction(() => repository.cancelEntry(id, reason: reason));
  Future<void> cancelAppointment(int id, String reason) =>
      _runAction(() => repository.cancelAppointment(id, reason));
  Future<void> markNoShow(int id) =>
      _runAction(() => repository.markNoShow(id));
  Future<void> restore(int id) => _runAction(() => repository.restoreEntry(id));
  Future<void> collect(int id, int amount) =>
      _runAction(() => repository.collectEntry(id, amount));
  Future<void> advance(int id) => _runAction(() => repository.advanceEntry(id));
  Future<void> toggleUrgent(int id, bool val) =>
      _runAction(() => repository.setUrgent(id, val));

  Future<void> reorderWaiting(int oldIndex, int newIndex) async {
    final loaded = state.maybeMap(loaded: (s) => s, orElse: () => null);
    if (loaded == null || loaded.isSubmitting) return;
    final ascending = loaded.waitingGroup;
    final waiting = loaded.sortOrder == QueueSortOrder.ticketDescending
        ? ascending.reversed.toList()
        : ascending;
    if (oldIndex < 0 || oldIndex >= waiting.length) return;
    if (newIndex < 0 || newIndex > waiting.length) return;
    if (oldIndex == newIndex) return;
    final moved = [...waiting];
    final target = newIndex == waiting.length ? waiting.length - 1 : newIndex;
    moved.insert(target, moved.removeAt(oldIndex));
    final base = loaded.tickets
        .where((t) => t.status == QueueStatus.inConsultation || t.isUrgent)
        .fold<int>(0, (m, t) => math.max(m, t.position));
    final reordered = [
      for (var i = 0; i < moved.length; i++)
        moved[i].copyWith(position: base + i + 1),
    ];
    emit(
      loaded.copyWith(
        tickets: loaded.replaceWaiting(reordered),
        sortOrder: QueueSortOrder.ticketAscending,
        actionError: null,
      ),
    );
    final result = await repository.reorderWaiting(
      reordered.map((t) => t.entryId).toList(),
    );
    if (isClosed) return;
    result.fold((f) {
      emit(loaded.copyWith(actionError: f.message));
      _reloadSilently(loaded);
    }, (_) {});
  }

  Future<void> _runAction(FutureResult<void> Function() run) async {
    final current = state;
    if (current is! _Loaded || current.isSubmitting) return;
    emit(current.copyWith(isSubmitting: true, actionError: null));
    final result = await run();
    if (isClosed) return;
    result.fold(
      (f) =>
          emit(current.copyWith(isSubmitting: false, actionError: f.message)),
      (_) => _reloadSilently(current),
    );
  }

  Future<void> _reloadSilently(_Loaded previous) async {
    final board = await repository.getTodayBoard();
    if (isClosed) return;
    board.fold(
      (f) =>
          emit(previous.copyWith(isSubmitting: false, actionError: f.message)),
      (b) => emit(
        previous.copyWith(
          tickets: b.tickets,
          isSubmitting: false,
          actionError: null,
        ),
      ),
    );
  }
}
