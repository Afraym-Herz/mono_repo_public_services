import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_list_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_toolbar_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/widgets/patients_header_connected.dart';
import 'package:doctor_clinics_app/features/patients/presentation/widgets/patients_table.dart';
import 'package:doctor_clinics_app/features/patients/presentation/widgets/patients_toolbar.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/appointment_cubit.dart';

/// Displays all patients with live search and filters.
class PatientListScreen extends StatelessWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<PatientListCubit>()..load()),
        BlocProvider(create: (_) => getIt<PatientToolbarCubit>()),
        // Planner for the search suggestions' "book a new appointment" flow;
        // created cold and loaded right before the first booking.
        BlocProvider(create: (_) => getIt<AppointmentCubit>()),
      ],
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
          const PatientsToolbar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                Dimensions.PADDING_SIZE_LARGE.w,
                0,
                Dimensions.PADDING_SIZE_LARGE.w,
                Dimensions.PADDING_SIZE_SMALL.h,
              ),
              child: const PatientsTable(),
            ),
          ),
        ],
      ),
    );
  }
}
