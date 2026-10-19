part of 'queue_cubit.dart';

@freezed
class QueueState with _$QueueState {
  const factory QueueState.initial() = _Initial;
  const factory QueueState.loading() = _Loading;
  const factory QueueState.loaded({
    required List<QueueTicket> tickets,
    required List<BookedAppointment> booked,
    @Default(QueueListFilter.all) QueueListFilter filter,
    @Default(QueueSortOrder.ticketAscending) QueueSortOrder sortOrder,
    @Default(0) int defaultFeePiasters,
    @Default(false) bool isSubmitting,
    String? actionError,
  }) = _Loaded;
  const factory QueueState.error({required String message}) = _Error;
}

extension QueueStateX on QueueState {
  List<QueueTicket> get allTickets => maybeMap(
        loaded: (s) => s.tickets,
        orElse: () => const <QueueTicket>[],
      );

  List<BookedAppointment> get allBooked => maybeMap(
        loaded: (s) => s.booked,
        orElse: () => const <BookedAppointment>[],
      );

  QueueListFilter get listFilter => maybeMap(
        loaded: (s) => s.filter,
        orElse: () => QueueListFilter.all,
      );

  QueueSortOrder get listSortOrder => maybeMap(
        loaded: (s) => s.sortOrder,
        orElse: () => QueueSortOrder.ticketAscending,
      );

  String? get actionError => maybeMap(
        loaded: (s) => s.actionError,
        orElse: () => null,
      );

  List<QueueTicket> get waitingGroup => allTickets
      .where((t) => t.status == QueueStatus.waiting && !t.isUrgent)
      .toList()
    ..sort((a, b) => a.position.compareTo(b.position));

  QueueState withEntries(
    List<QueueTicket> tickets,
    List<BookedAppointment> booked,
  ) =>
      maybeMap(
        loaded: (s) => s.copyWith(tickets: tickets, booked: booked),
        orElse: () => QueueState.loaded(
          tickets: tickets,
          booked: booked,
          filter: listFilter,
          sortOrder: listSortOrder,
        ),
      );

  QueueState withListSelection({
    QueueListFilter? filter,
    QueueSortOrder? sortOrder,
  }) =>
      maybeMap(
        loaded: (s) => s.copyWith(
          filter: filter ?? s.filter,
          sortOrder: sortOrder ?? s.sortOrder,
        ),
        orElse: () => this,
      );

  List<QueueTicket> replaceWaiting(List<QueueTicket> reordered) {
    final map = {for (final t in reordered) t.entryId: t};
    return allTickets.map((t) => map[t.entryId] ?? t).toList();
  }
}
