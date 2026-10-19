import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_blob.dart';

/// Soft out-of-focus teal circles adding depth inside the gradient card.
class BrandingDecorativeBlobs extends StatelessWidget {
  const BrandingDecorativeBlobs({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.clinicIsDark;
    final tealTint = AppColors.clinicPrimaryContainer.withValues(
      alpha: isDark ? 0.10 : 0.07,
    );
    final blueTint = AppColors.clinicSecondary.withValues(
      alpha: isDark ? 0.10 : 0.06,
    );
    final primaryTint = AppColors.primaryColor.withValues(
      alpha: isDark ? 0.08 : 0.05,
    );
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            BrandingBlob(
              color: tealTint,
              size: 220,
              bottom: -60.h,
              end: -60.w,
            ),
            BrandingBlob(
              color: tealTint,
              size: 140,
              top: -40.h,
              start: -30.w,
            ),
            BrandingBlob(
              color: blueTint,
              size: 160,
              top: 40.h,
              end: -50.w,
            ),
            BrandingBlob(
              color: blueTint,
              size: 120,
              bottom: -70.h,
              start: 40.w,
            ),
            BrandingBlob(
              color: primaryTint,
              size: 100,
              bottom: -20.h,
              end: 60.w,
            ),
          ],
        ),
      ),
    );
  }
}
