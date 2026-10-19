import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/widgets/patients_header_connected.dart';

/// Displays all patients with live search and filters.
class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PatientCubit>()..loadPatients(),
      child: AdaptiveLayout(
        mobileLayout: (_) => const _PatientListBody(),
        tabletLayout: (_) => const _PatientListBody(),
        desktopLayout: (_) => const _PatientListBody(),
      ),
    );
  }
}

class _PatientListBody extends StatelessWidget {
  const _PatientListBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.clinicBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PatientsHeaderConnected(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_LARGE.w,
              ),
              child: ZoomIn(
                delay: const Duration(milliseconds: 300),
                child: AppSectionCard(
                  title: 'patients.list_title'.tr(),
                  icon: Icons.people_outline,
                  animationDelay: const Duration(milliseconds: 350),
                  child: Text(
                    'patients.list_placeholder'.tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
