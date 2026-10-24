part of 'operation_board_cubit.dart';

/// Client-side board navigation: status tabs, week focus and card expansion.
mixin OperationBoardNavigation on Cubit<OperationBoardState> {
  /// Switches the active status tab, collapsing any open card.
  void setFilter(OperationFilter filter) => _apply(
    filter: filter,
    focusedDay: state.maybeMap(
      loaded: (loaded) => loaded.focusedDay,
      orElse: () => null,
    ),
  );

  /// Focuses one week-day cell; tapping the active day clears the focus.
  void focusDay(DateTime day) {
    final current = state.maybeMap(
      loaded: (loaded) => loaded,
      orElse: () => null,
    );
    if (current == null) return;
    final active = current.focusedDay;
    final isActive =
        active != null &&
        active.year == day.year &&
        active.month == day.month &&
        active.day == day.day;
    _apply(
      filter: current.filter,
      focusedDay: isActive ? null : DateTime(day.year, day.month, day.day),
    );
  }

  /// Clears the week-day focus while keeping the active status tab.
  void clearFocus() {
    final current = state.maybeMap(
      loaded: (loaded) => loaded,
      orElse: () => null,
    );
    if (current == null) return;
    _apply(filter: current.filter);
  }

  /// Expands [operationId] or collapses it when it is already open.
  void toggleEntry(int operationId) {
    final current = state.maybeMap(
      loaded: (loaded) => loaded,
      orElse: () => null,
    );
    if (current == null) return;
    emit(
      current.copyWith(
        expandedId: current.expandedId == operationId ? null : operationId,
      ),
    );
  }

  void _apply({required OperationFilter filter, DateTime? focusedDay}) {
    final current = state.maybeMap(
      loaded: (loaded) => loaded,
      orElse: () => null,
    );
    if (current == null) return;
    emit(
      current.copyWith(
        filter: filter,
        focusedDay: focusedDay,
        expandedId: null,
      ),
    );
  }
}
