import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/patient_cubit.dart';
import '../widgets/patient_profile_panel.dart';

/// Barrier-backed host for the read-only patient profile.
///
/// Pushed with `transparentModalRoutePage(...)` so the register stays visible
/// behind the modal, and wrapped in [AdaptiveLayout] for the ScreenUtil scope.
class PatientProfileModalScreen extends StatelessWidget {
  const PatientProfileModalScreen({super.key, required this.patientId});

  final int patientId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PatientCubit>()..loadPatientDetail(patientId),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: AdaptiveLayout(
          mobileLayout: (_) => _CenteredProfile(patientId: patientId),
          tabletLayout: (_) => _CenteredProfile(patientId: patientId),
          desktopLayout: (_) => _CenteredProfile(patientId: patientId),
        ),
      ),
    );
  }
}

class _CenteredProfile extends StatelessWidget {
  const _CenteredProfile({required this.patientId});

  final int patientId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Dimensions.PATIENT_PROFILE_MAX_WIDTH,
            maxHeight:
                MediaQuery.sizeOf(context).height *
                Dimensions.MODAL_MAX_HEIGHT_FACTOR,
          ),
          child: PatientProfilePanel(patientId: patientId),
        ),
      ),
    );
  }
}
