import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/queue_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_body.dart';

class QueueScreen extends StatelessWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QueueCubit>()..loadTodayQueue(),
      child: BlocListener<QueueCubit, QueueState>(
        listenWhen: (a, b) => a.actionError != b.actionError,
        listener: (context, state) {
          final error = state.actionError;
          if (error != null) {
            AppSnackBar.showError(context, error.tr());
            context.read<QueueCubit>().clearActionError();
          }
        },
        child: AdaptiveLayout(
          mobileLayout: (_) => const QueueBody(),
          tabletLayout: (_) => const QueueBody(),
          desktopLayout: (_) => const QueueBody(),
        ),
      ),
    );
  }
}
