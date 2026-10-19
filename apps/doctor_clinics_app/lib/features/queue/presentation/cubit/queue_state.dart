part of 'queue_cubit.dart';

@freezed
class QueueState with _$QueueState {
  const factory QueueState.initial() = _Initial;
  const factory QueueState.loading() = _Loading;
  const factory QueueState.loaded({
    required List<QueueEntry> entries,
    required List<Appointment> appointments,
    @Default(QueueListFilter.all) QueueListFilter filter,
    @Default(QueueSortOrder.ticketAscending) QueueSortOrder sortOrder,
  }) = _Loaded;
  const factory QueueState.error({
    required String message,
  }) = _Error;
}

/// Read-side helpers for the queue list head.
///
/// Screens never switch on the private variant types: while the queue loads (or
/// after an error) the tab falls back to "all" with empty counts, and the tab +
/// ordering survive a reload.
extension QueueStateListX on QueueState {
  /// Today's queue entries, empty unless the state is `loaded`.
  List<QueueEntry> get listEntries => maybeWhen(
        loaded: (entries, appointments, filter, sortOrder) => entries,
        orElse: () => const <QueueEntry>[],
      );

  /// Status tab currently filtering the list.
  QueueListFilter get listFilter => maybeWhen(
        loaded: (entries, appointments, filter, sortOrder) => filter,
        orElse: () => QueueListFilter.all,
      );

  /// Ticket ordering currently applied to the list.
  QueueSortOrder get listSortOrder => maybeWhen(
        loaded: (entries, appointments, filter, sortOrder) => sortOrder,
        orElse: () => QueueSortOrder.ticketAscending,
      );

  /// Same state re-seeded with freshly loaded [entries] + [appointments].
  QueueState withEntries(
    List<QueueEntry> entries,
    List<Appointment> appointments,
  ) => QueueState.loaded(
        entries: entries,
        appointments: appointments,
        filter: listFilter,
        sortOrder: listSortOrder,
      );

  /// Same state with a new [filter] and/or [sortOrder].
  QueueState withListSelection({QueueListFilter? filter, QueueSortOrder? sortOrder}) =>
      maybeMap(
        loaded: (loaded) => loaded.copyWith(
          filter: filter ?? loaded.listFilter,
          sortOrder: sortOrder ?? loaded.listSortOrder,
        ),
        orElse: () => this,
      );
}
