import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Name cell: the patient's full name.
class PatientRowIdentity extends StatelessWidget {
  const PatientRowIdentity({super.key, required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      patient.fullName,
      fontSize: Dimensions.FONT_SIZE_SMALL,
      fontWeight: FontWeight.w700,
      color: context.clinicTextPrimary,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
