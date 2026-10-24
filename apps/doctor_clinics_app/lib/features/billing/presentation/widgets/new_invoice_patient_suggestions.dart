import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

import '../helpers/invoice_form_controller.dart';
import 'new_invoice_patient_matches.dart';

/// Overlay content of the invoice patient picker.
class NewInvoicePatientSuggestions extends StatelessWidget {
  const NewInvoicePatientSuggestions({
    super.key,
    required this.controller,
    required this.link,
    required this.width,
    required this.onDismiss,
  });

  final InvoiceFormController controller;
  final LayerLink link;
  final double width;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Patient>>(
      future: controller.patients,
      builder: (context, snapshot) {
        final patients = snapshot.data ?? controller.lastPatients;
        return SizedBox.expand(
          child: Stack(
            children: [
              if (patients != null)
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onDismiss,
                  ),
                ),
              CompositedTransformFollower(
                link: link,
                targetAnchor: Alignment.bottomLeft,
                followerAnchor: Alignment.topLeft,
                offset: Offset(0, Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
                child: SizedBox(
                  width: width,
                  child: patients == null
                      ? const SizedBox.shrink()
                      : ValueListenableBuilder<TextEditingValue>(
                          valueListenable: controller.patientSearch,
                          builder: (context, value, _) =>
                              NewInvoicePatientMatches(
                                patients: patients,
                                query: value.text.trim().toLowerCase(),
                                selectedId: controller.patient.value?.id,
                                onPick: controller.selectPatient,
                              ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
