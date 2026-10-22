import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/patient.dart';
import '../../domain/entities/patient_list_row.dart';
import 'patient_book_new_tile.dart';
import 'patient_suggestion_row.dart';

/// Suggestion card floating under the patients search field.
///
/// Lists up to [maxSuggestions] patients matching the debounced query; a tap
/// books a new appointment for that patient. When nobody matches, one
/// "Book new appointment" tile opens the sheet, which offers "New patient".
class PatientSearchSuggestions extends StatelessWidget {
  const PatientSearchSuggestions({
    super.key,
    required this.rows,
    required this.query,
    required this.onBook,
    required this.onBookNew,
  });

  /// How many matches are offered before the list is cut off.
  static const int maxSuggestions = 6;

  final List<PatientListRow> rows;

  /// Lower-cased debounced search text.
  final String query;

  /// Books an appointment for the tapped patient.
  final ValueChanged<Patient> onBook;

  /// Opens the sheet without a pre-selected patient.
  final VoidCallback onBookNew;

  /// Same matching rules as the booking sheet's patient picker.
  static bool matchesQuery(Patient patient, String query) =>
      patient.fullName.toLowerCase().contains(query) ||
      patient.fileNumber.toLowerCase().contains(query) ||
      (patient.phone ?? '').contains(query);

  @override
  Widget build(BuildContext context) {
    final matches = rows
        .map((row) => row.patient)
        .where((patient) => matchesQuery(patient, query))
        .take(maxSuggestions)
        .toList(growable: false);

    return Material(
      color: context.clinicIsDark ? context.clinicContainer : context.cardColor,
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        side: BorderSide(color: context.clinicBorder),
      ),
      child: matches.isEmpty
          ? PatientBookNewTile(onTap: onBookNew)
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final patient in matches)
                  PatientSuggestionRow(
                    patient: patient,
                    onTap: () => onBook(patient),
                  ),
              ],
            ),
    );
  }
}
