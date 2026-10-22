/// Builds the lower-cased `patients.search_text` column.
///
/// Registration and inline profile edits both use this so renaming a patient
/// keeps the register's local search working.
class PatientSearchText {
  PatientSearchText._();

  static String of({required String fullName, String? phone}) => [
    fullName,
    phone ?? '',
  ].where((value) => value.trim().isNotEmpty).join(' ').toLowerCase();
}
