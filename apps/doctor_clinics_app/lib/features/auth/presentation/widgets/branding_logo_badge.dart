import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Circular teal gradient logo badge with a medical cross icon.
class BrandingLogoBadge extends StatelessWidget {
  const BrandingLogoBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.r,
      height: 48.r,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [AppColors.clinicPrimary, AppColors.clinicPrimaryContainer],
        ),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.clinicPrimaryContainer.withValues(alpha: 0.35),
            blurRadius: 14.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Icon(
        Icons.medical_services_outlined,
        size: Dimensions.ICON_SIZE_DEFAULT.r,
        color: AppColors.white,
      ),
    );
  }
}
