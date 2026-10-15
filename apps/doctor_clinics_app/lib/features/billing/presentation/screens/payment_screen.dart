import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: implement payment UI
/// Record a payment against an invoice.
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (_) => const _PaymentBody(),
      tabletLayout: (_) => const _PaymentBody(),
      desktopLayout: (_) => const _PaymentBody(),
    );
  }
}

class _PaymentBody extends StatelessWidget {
  const _PaymentBody();

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
                  title: 'Payment',
                  subtitle: 'Record a payment against an invoice',
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                ZoomIn(
                  delay: const Duration(milliseconds: 300),
                  child: AppSectionCard(
                    title: 'Payment details',
                    icon: Icons.payments_outlined,
                    animationDelay: const Duration(milliseconds: 350),
                    child: Text(
                      'TODO: Payment Screen',
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
