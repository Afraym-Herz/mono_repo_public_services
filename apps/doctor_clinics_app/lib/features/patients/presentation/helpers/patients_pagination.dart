import 'dart:math' as math;

import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';

/// Page window for the patients register.
///
/// The register is small and fully loaded (offline MVP), so paging is applied
/// in memory after search/filter — no extra database query.
class PatientsPagination {
  PatientsPagination._();

  /// Rows shown per page.
  static const int pageSize = 10;

  static int pageCount(int rowCount) =>
      rowCount == 0 ? 0 : (rowCount + pageSize - 1) ~/ pageSize;

  /// Keeps a stale page (e.g. after deleting the last row) inside the range.
  static int clampPage(int page, int rowCount) {
    final last = pageCount(rowCount) - 1;
    return last < 0 ? 0 : page.clamp(0, last);
  }

  static List<PatientListRow> slice(List<PatientListRow> rows, int page) {
    final start = page * pageSize;
    if (start >= rows.length) return const [];
    final end = math.min(start + pageSize, rows.length);
    return rows.sublist(start, end);
  }
}
