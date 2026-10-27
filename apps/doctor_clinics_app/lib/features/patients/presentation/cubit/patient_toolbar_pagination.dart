part of 'patient_toolbar_cubit.dart';

/// Page navigation for the in-memory patients register.
mixin PatientToolbarPagination on Cubit<PatientToolbarState> {
  /// Moves one page back, if there is one.
  void previousPage() {
    if (state.page == 0) return;
    emit(state.copyWith(page: state.page - 1));
  }

  /// Moves one page forward, bounded by [pageCount].
  void nextPage(int pageCount) {
    if (state.page >= pageCount - 1) return;
    emit(state.copyWith(page: state.page + 1));
  }

  /// Pulls a stale page back inside the range after rows shrink.
  void clampPage(int pageCount) {
    final last = pageCount - 1;
    if (last < 0 || state.page <= last) return;
    emit(state.copyWith(page: last));
  }
}
