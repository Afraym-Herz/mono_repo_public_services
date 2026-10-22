import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/patient_cubit.dart';
import 'patient_profile_details.dart';
import 'patient_profile_error.dart';
import 'patient_profile_loading.dart';

/// Card chrome for the editable patient profile modal.
class PatientProfilePanel extends StatelessWidget {
  const PatientProfilePanel({super.key, required this.patientId});

  final int patientId;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE.r),
          border: Border.all(color: context.clinicBorder),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowMedium,
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: BlocBuilder<PatientCubit, PatientState>(
          builder: (context, state) => state.maybeMap(
            patientDetail: (detail) =>
                PatientProfileDetails(patient: detail.patient),
            error: (_) => Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
              child: PatientProfileError(
                onRetry: () =>
                    context.read<PatientCubit>().loadPatientDetail(patientId),
              ),
            ),
            orElse: () => Padding(
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
              child: const PatientProfileLoading(),
            ),
          ),
        ),
      ),
    );
  }
}
