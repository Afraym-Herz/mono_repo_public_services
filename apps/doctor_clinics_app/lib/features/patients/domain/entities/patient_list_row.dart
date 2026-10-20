import 'package:freezed_annotation/freezed_annotation.dart';

import 'patient.dart';

part 'patient_list_row.freezed.dart';

/// One row of the patients register.
///
/// Composes the stored [Patient] with the clinical/financial context the table
/// shows, so the widgets never reach into other features' repositories:
/// [lastVisit] is the newest consultation, [followUpDate] the nearest upcoming
/// follow-up, and [debtPiasters] the sum of unpaid invoice balances.
@freezed
class PatientListRow with _$PatientListRow {
  const factory PatientListRow({
    required Patient patient,
    DateTime? lastVisit,
    DateTime? followUpDate,
    @Default(0) int debtPiasters,
  }) = _PatientListRow;
}
