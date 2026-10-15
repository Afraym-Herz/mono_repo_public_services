import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: implement clinic template UI
/// Edit the clinic template (header, footer, print settings).
class ClinicTemplateScreen extends StatelessWidget {
  const ClinicTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (_) => const _ClinicTemplateBody(),
      tabletLayout: (_) => const _ClinicTemplateBody(),
      desktopLayout: (_) => const _ClinicTemplateBody(),
    );
  }
}

class _ClinicTemplateBody extends StatelessWidget {
  const _ClinicTemplateBody();

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
                  title: 'Clinic Template',
                  subtitle: 'Header, footer and print settings',
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                ZoomIn(
                  delay: const Duration(milliseconds: 300),
                  child: AppSectionCard(
                    title: 'Template settings',
                    icon: Icons.design_services_outlined,
                    animationDelay: const Duration(milliseconds: 350),
                    child: Text(
                      'TODO: Clinic Template Screen',
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
