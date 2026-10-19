import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_feature_card.dart';

/// Row of the three feature cards (quick registration, triage, billing).
class BrandingFeatureCards extends StatelessWidget {
  const BrandingFeatureCards({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: const Duration(milliseconds: 200),
      // IntrinsicHeight forces every card to match the tallest sibling, so
      // all three render with identical width (Expanded) and height.
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: BrandingFeatureCard(
                icon: Icons.flash_on,
                title: 'branding_card_fast_title'.tr(),
                subtitle: 'branding_card_fast_body'.tr(),
                stat: 'branding_card_fast_stat'.tr(),
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(
              child: BrandingFeatureCard(
                icon: Icons.medical_information_outlined,
                title: 'branding_card_records_title'.tr(),
                subtitle: 'branding_card_records_body'.tr(),
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(
              child: BrandingFeatureCard(
                icon: Icons.receipt_long_outlined,
                title: 'branding_card_billing_title'.tr(),
                subtitle: 'branding_card_billing_body'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
