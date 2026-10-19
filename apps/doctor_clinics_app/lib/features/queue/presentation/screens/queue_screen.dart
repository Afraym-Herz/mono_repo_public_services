import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/queue/presentation/cubit/queue_cubit.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/queue_list_head.dart';
import 'package:doctor_clinics_app/features/queue/presentation/widgets/today_queue_header.dart';

/// Live waiting queue for today.
///
/// The day banner docks directly under the shared top bar — mirroring the home
/// dashboard — with the list head (status tabs, ticket ordering, refresh)
/// pinned above the queue list canvas.
class QueueScreen extends StatelessWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QueueCubit>()..loadTodayQueue(),
      child: AdaptiveLayout(
        mobileLayout: (_) => const _QueueBody(),
        tabletLayout: (_) => const _QueueBody(),
        desktopLayout: (_) => const _QueueBody(),
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
            child: const QueueListHead(
              delay: Duration(milliseconds: 250),
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: ZoomIn(
                delay: const Duration(milliseconds: 300),
                child: AppSectionCard(
                  title: 'queue.list_title'.tr(),
                  icon: Icons.groups_outlined,
                  animationDelay: const Duration(milliseconds: 350),
                  child: Text(
                    'queue.list_placeholder'.tr(),
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
