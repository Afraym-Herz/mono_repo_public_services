import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

import '../helpers/patient_row_format.dart';
import 'patient_profile_field.dart';
import 'patient_profile_field_pair.dart';

/// Read-only personal details captured at registration.
class PatientProfileContent extends StatelessWidget {
  const PatientProfileContent({super.key, required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PatientProfileField(
          label: 'patient_profile.name'.tr(),
          value: patient.fullName,
          icon: Icons.person_outline_rounded,
        ),
        gap,
        PatientProfileFieldPair(
          leading: PatientProfileField(
            label: 'patient_profile.gender'.tr(),
            value: PatientRowFormat.gender(patient),
            icon: Icons.wc_rounded,
          ),
          trailing: PatientProfileField(
            label: 'patient_profile.blood_type'.tr(),
            value: patient.bloodType ?? 'patients.table.none'.tr(),
            icon: Icons.bloodtype_outlined,
          ),
        ),
        gap,
        PatientProfileFieldPair(
          leading: PatientProfileField(
            label: 'patient_profile.age'.tr(),
            value: PatientRowFormat.age(patient, context),
            icon: Icons.cake_outlined,
          ),
          trailing: PatientProfileField(
            label: 'patient_profile.phone'.tr(),
            value: patient.phone ?? 'patients.table.none'.tr(),
            icon: Icons.phone_outlined,
          ),
        ),
        gap,
        PatientProfileField(
          label: 'patient_profile.notes'.tr(),
          value: patient.notes ?? 'patients.table.none'.tr(),
          icon: Icons.edit_note_rounded,
          maxLines: 3,
        ),
      ],
    );
  }
}
