import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Barrier-backed card chrome shared by the billing detail modals.
class FinanceModalShell extends StatelessWidget {
  const FinanceModalShell({
    super.key,
    required this.child,
    this.maxWidth = Dimensions.BILLING_DETAIL_MAX_WIDTH,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: AdaptiveLayout(
        mobileLayout: (_) => _CenteredCard(maxWidth: maxWidth, child: child),
        tabletLayout: (_) => _CenteredCard(maxWidth: maxWidth, child: child),
        desktopLayout: (_) => _CenteredCard(maxWidth: maxWidth, child: child),
      ),
    );
  }
}

class _CenteredCard extends StatelessWidget {
  const _CenteredCard({required this.maxWidth, required this.child});

  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.r),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
            maxHeight:
                MediaQuery.sizeOf(context).height *
                Dimensions.MODAL_MAX_HEIGHT_FACTOR,
          ),
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
            clipBehavior: Clip.antiAlias,
            child: child,
          ),
        ),
      ),
    );
  }
}
