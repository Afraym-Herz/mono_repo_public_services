import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/theme/app_brand_colors.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_decorative_blobs.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_footer.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_header.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_panel_middle.dart';

/// Branding canvas filling the 2/3 split beside the auth panel.
///
/// Layout (RTL-first, per DESIGN reference):
/// - header  : logo badge + clinic identity (start), release pill (end)
/// - middle  : eyebrow badge, headline, supporting paragraph
/// - cards   : three feature cards in a row
/// - footer  : availability + hotline + version-upgrade pill
class BrandingPanel extends StatelessWidget {
  const BrandingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.clinicBackground,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
      child: Container(
        // One soft gradient card holding the whole branding content and
        // stretching to every available side. Inner padding lives inside the
        // ClipRRect so the decorative blobs bleed to the card edge.
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: context.clinicIsDark
                ? brandingDarkGradientStops
                : brandingLightGradientStops,
            stops: brandingGradientStops,
          ),
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
          border: Border.all(color: context.clinicBorder),
          boxShadow: [
            BoxShadow(
              color: AppColors.clinicPrimaryContainer.withValues(alpha: 0.12),
              blurRadius: 24.r,
              offset: Offset(0, 10.h),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_EXTRA_LARGE.r),
          child: Stack(
            children: [
              const BrandingDecorativeBlobs(),
              Padding(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const BrandingHeader(),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h,
                    ),
                    const Expanded(child: BrandingPanelMiddle()),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_LARGE.h,
                    ),
                    const BrandingFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
