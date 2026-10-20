import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

import '../helpers/patient_row_format.dart';

/// Stored file number (`1042`), shown in tabular weight for quick scanning.
class PatientFileNumberCell extends StatelessWidget {
  const PatientFileNumberCell({super.key, required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      patient.fileNumber,
      fontSize: Dimensions.FONT_SIZE_SMALL,
      fontWeight: FontWeight.w600,
      color: context.clinicTextSecondary,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// Age in years plus gender (`٣٨ سنة / ذكر`).
class PatientAgeGenderCell extends StatelessWidget {
  const PatientAgeGenderCell({super.key, required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      PatientRowFormat.ageGender(patient, context),
      fontSize: Dimensions.FONT_SIZE_SMALL,
      color: context.clinicTextSecondary,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
