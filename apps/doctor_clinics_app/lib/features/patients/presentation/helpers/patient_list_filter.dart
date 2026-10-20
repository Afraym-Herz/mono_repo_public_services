import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';

import 'patient_filter.dart';

/// Applies the toolbar search query and filter chip to the loaded rows.
///
/// The register is small enough (offline MVP) to filter in memory, so typing in
/// the toolbar never re-queries the database.
class PatientListFilter {
  PatientListFilter._();

  /// A follow-up counts as "soon" when it falls inside the next week.
  static const int followUpWindowDays = 7;

  static List<PatientListRow> apply({
    required List<PatientListRow> rows,
    required String query,
    required PatientFilter filter,
  }) {
    final normalized = query.trim().toLowerCase();
    return rows
        .where(
          (row) =>
              _matchesQuery(row, normalized) && _matchesFilter(row, filter),
        )
        .toList(growable: false);
  }

  static bool _matchesFilter(PatientListRow row, PatientFilter filter) {
    return switch (filter) {
      PatientFilter.all => true,
      PatientFilter.newPatient => row.lastVisit == null,
      PatientFilter.followUpSoon => _isFollowUpSoon(row.followUpDate),
      PatientFilter.indebtedness => row.debtPiasters > 0,
    };
  }

  static bool _matchesQuery(PatientListRow row, String query) {
    if (query.isEmpty) return true;
    final patient = row.patient;
    return patient.fullName.toLowerCase().contains(query) ||
        patient.fileNumber.toLowerCase().contains(query) ||
        (patient.phone ?? '').toLowerCase().contains(query) ||
        (patient.phone2 ?? '').toLowerCase().contains(query);
  }

  static bool _isFollowUpSoon(DateTime? followUpDate) {
    if (followUpDate == null) return false;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final limit = today.add(const Duration(days: followUpWindowDays));
    final day = DateTime(
      followUpDate.year,
      followUpDate.month,
      followUpDate.day,
    );
    return !day.isBefore(today) && !day.isAfter(limit);
  }
}
