import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/appointment_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/appointment_body.dart';

/// Day/Week/Month appointment planner. The "Book new appointment" action is
/// the only way a booking is created; booking assigns the next permanent day
/// number.
class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AppointmentCubit>()..load(),
      child: BlocListener<AppointmentCubit, AppointmentState>(
        listenWhen: (a, b) => a.actionError != b.actionError,
        listener: (context, state) {
          final error = state.actionError;
          if (error != null) {
            AppSnackBar.showError(context, error.tr());
            context.read<AppointmentCubit>().clearActionError();
          }
        },
        child: AdaptiveLayout(
          mobileLayout: (_) => const AppointmentBody(),
          tabletLayout: (_) => const AppointmentBody(),
          desktopLayout: (_) => const AppointmentBody(),
        ),
      ),
    );
  }
}
