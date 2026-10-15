import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: implement invoice UI
/// Create / view a single invoice with line items.
class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (_) => const _InvoiceBody(),
      tabletLayout: (_) => const _InvoiceBody(),
      desktopLayout: (_) => const _InvoiceBody(),
    );
  }
}

class _InvoiceBody extends StatelessWidget {
  const _InvoiceBody();

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
                  title: 'Invoice',
                  subtitle: 'Create or view an invoice',
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                ZoomIn(
                  delay: const Duration(milliseconds: 300),
                  child: AppSectionCard(
                    title: 'Invoice details',
                    icon: Icons.description_outlined,
                    animationDelay: const Duration(milliseconds: 350),
                    child: Text(
                      'TODO: Invoice Screen',
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
