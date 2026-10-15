import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: implement prescription template UI
/// Reusable prescription templates.
class PrescriptionTemplateScreen extends StatelessWidget {
  const PrescriptionTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (_) => const _PrescriptionTemplateBody(),
      tabletLayout: (_) => const _PrescriptionTemplateBody(),
      desktopLayout: (_) => const _PrescriptionTemplateBody(),
    );
  }
}

class _PrescriptionTemplateBody extends StatelessWidget {
  const _PrescriptionTemplateBody();

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
                  title: 'Prescription Templates',
                  subtitle: 'Reusable prescription templates',
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                ZoomIn(
                  delay: const Duration(milliseconds: 300),
                  child: AppSectionCard(
                    title: 'Template list',
                    icon: Icons.content_copy_outlined,
                    animationDelay: const Duration(milliseconds: 350),
                    child: Text(
                      'Prescription Templates UI placeholder',
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
