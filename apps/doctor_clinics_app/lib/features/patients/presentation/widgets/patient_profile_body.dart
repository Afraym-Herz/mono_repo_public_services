import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

import '../helpers/patient_profile_edit_controller.dart';
import 'patient_profile_content.dart';
import 'patient_profile_header.dart';

/// Card body: header, divider and the scrollable profile content.
class PatientProfileBody extends StatelessWidget {
  const PatientProfileBody({
    super.key,
    required this.patient,
    required this.controller,
    required this.isEditing,
    required this.isSaving,
    required this.onEdit,
    required this.onCancel,
    required this.onSave,
    required this.onClose,
  });

  final Patient patient;
  final PatientProfileEditController controller;
  final bool isEditing;
  final bool isSaving;
  final VoidCallback onEdit;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PatientProfileHeader(
          fileNumber: patient.fileNumber,
          isEditing: isEditing,
          isSaving: isSaving,
          onEdit: onEdit,
          onCancel: onCancel,
          onSave: onSave,
          onClose: onClose,
        ),
        Divider(height: 1, thickness: 1, color: context.clinicBorder),
        Flexible(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
            child: PatientProfileContent(
              patient: patient,
              controller: controller,
              isEditing: isEditing,
            ),
          ),
        ),
      ],
    );
  }
}
