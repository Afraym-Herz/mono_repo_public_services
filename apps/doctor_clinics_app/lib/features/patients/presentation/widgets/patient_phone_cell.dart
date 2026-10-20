import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

import 'patient_empty_value.dart';

/// Primary phone with the optional second number on a smaller line.
class PatientPhoneCell extends StatelessWidget {
  const PatientPhoneCell({super.key, required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    final numbers = [patient.phone, patient.phone2]
        .whereType<String>()
        .where((value) => value.trim().isNotEmpty)
        .toList(growable: false);

    if (numbers.isEmpty) return const PatientEmptyValue();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveText(
          numbers.first,
          fontSize: Dimensions.FONT_SIZE_SMALL,
          color: context.clinicTextPrimary,
          maxLines: 1,
        ),
        if (numbers.length > 1)
          ResponsiveText(
            numbers[1],
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: context.clinicTextSecondary,
            maxLines: 1,
          ),
      ],
    );
  }
}
