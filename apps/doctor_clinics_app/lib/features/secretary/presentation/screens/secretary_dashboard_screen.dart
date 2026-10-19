import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: implement secretary dashboard UI
/// Main dashboard for the secretary role.
/// Shows today's queue, upcoming appointments, and quick actions.
class SecretaryDashboardScreen extends StatelessWidget {
  const SecretaryDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (_) => const _SecretaryDashboardBody(),
      tabletLayout: (_) => const _SecretaryDashboardBody(),
      desktopLayout: (_) => const _SecretaryDashboardBody(),
    );
  }
}

class _SecretaryDashboardBody extends StatelessWidget {
  const _SecretaryDashboardBody();

  @override
  Widget build(BuildContext context) {
    final maxWidth = context.isMobileOrSmallTablet
        ? double.infinity
        : context.contentMaxWidth;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppFeatureHeader(
                  title: 'Secretary Dashboard',
                  subtitle: 'Today\'s queue and quick actions',
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                ZoomIn(
                  delay: const Duration(milliseconds: 300),
                  child: AppSectionCard(
                    title: 'Dashboard overview',
                    icon: Icons.dashboard_outlined,
                    animationDelay: const Duration(milliseconds: 350),
                    child: Text(
                      'TODO: Secretary Dashboard Screen',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
