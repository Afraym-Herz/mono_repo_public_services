import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/queue/presentation/widgets/today_queue_header.dart';

// TODO: implement queue UI
/// Live waiting queue for today.
///
/// The day banner docks directly under the shared top bar — mirroring the home
/// dashboard — with the queue list canvas filling the rest of the workspace.
class QueueScreen extends StatelessWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (_) => const _QueueBody(),
      tabletLayout: (_) => const _QueueBody(),
      desktopLayout: (_) => const _QueueBody(),
    );
  }
}

class _QueueBody extends StatelessWidget {
  const _QueueBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.clinicBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TodayQueueHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_LARGE.w,
              ),
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
