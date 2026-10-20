/// Column layout shared by the patients table head and its rows.
///
/// Keeping the flex weights in one place means the header never drifts out of
/// alignment with the cells below it.
class PatientsTableColumns {
  PatientsTableColumns._();

  static const int fileNumber = 2;
  static const int name = 5;
  static const int ageGender = 3;
  static const int phone = 3;
  static const int bloodType = 2;
  static const int lastVisit = 3;
  static const int account = 3;
  static const int actions = 3;

  /// Width below which the table scrolls horizontally (mobile / narrow tablet).
  static const double minWidth = 820;

  static const List<PatientsTableHeader> headers = [
    PatientsTableHeader('patients.table.file_number', fileNumber),
    PatientsTableHeader('patients.table.name', name),
    PatientsTableHeader('patients.table.age_gender', ageGender),
    PatientsTableHeader('patients.table.phone', phone),
    PatientsTableHeader('patients.table.blood_type', bloodType),
    PatientsTableHeader('patients.table.last_visit', lastVisit),
    PatientsTableHeader('patients.table.account', account),
    PatientsTableHeader('patients.table.actions', actions, centered: true),
  ];
}

/// One header cell: its translation key, flex weight and alignment.
class PatientsTableHeader {
  const PatientsTableHeader(this.labelKey, this.flex, {this.centered = false});

  final String labelKey;
  final int flex;
  final bool centered;
}
