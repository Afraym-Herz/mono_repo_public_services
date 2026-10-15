import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: implement prescription UI
/// Build / view a prescription for a patient.
class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (_) => const _PrescriptionBody(),
      tabletLayout: (_) => const _PrescriptionBody(),
      desktopLayout: (_) => const _PrescriptionBody(),
    );
  }
}

class _PrescriptionBody extends StatelessWidget {
  const _PrescriptionBody();

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
                  title: 'Prescription',
                  subtitle: 'Build or view a prescription',
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                ZoomIn(
                  delay: const Duration(milliseconds: 300),
                  child: AppSectionCard(
                    title: 'Prescription details',
                    icon: Icons.receipt_outlined,
                    animationDelay: const Duration(milliseconds: 350),
                    child: Text(
                      'TODO: Prescription Screen',
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
