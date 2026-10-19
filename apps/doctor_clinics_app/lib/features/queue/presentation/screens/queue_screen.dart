import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/presentation/cubit/queue_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_list.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_list_head.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_summary_strip.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/today_queue_header.dart';

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
          mobileLayout: (_) => const _QueueBody(),
          tabletLayout: (_) => const _QueueBody(),
          desktopLayout: (_) => const _QueueBody(),
        ),
      ),
    );
  }
}

class _QueueBody extends StatelessWidget {
  const _QueueBody();

  @override
  Widget build(BuildContext context) {
    final padding = Dimensions.PADDING_SIZE_LARGE.w;
    return Scaffold(
      backgroundColor: context.clinicBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TodayQueueHeader(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: const QueueSummaryStrip(),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: const QueueListHead(
              delay: Duration(milliseconds: 250),
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: QueueList(
                onTicketTap: (row) {
                  // Deferred details screen callback
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
