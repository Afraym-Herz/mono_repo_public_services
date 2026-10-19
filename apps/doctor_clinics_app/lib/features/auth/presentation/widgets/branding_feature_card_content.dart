import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Icon tile + title + body (+ optional stat chip) inside a feature card.
class BrandingFeatureCardContent extends StatelessWidget {
  const BrandingFeatureCardContent({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.stat,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? stat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36.r,
          height: 36.r,
          decoration: BoxDecoration(
            color: context.clinicAccent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
          ),
          child: Icon(
            icon,
            size: Dimensions.ICON_SIZE_SMALL.r,
            color: AppColors.clinicPrimaryContainer,
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        ResponsiveText(
          title,
          fontSize: Dimensions.FONT_SIZE_SMALL,
          fontWeight: FontWeight.w700,
          color: context.clinicTextPrimary,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        Expanded(
          child: ResponsiveText(
            subtitle,
            fontSize: Dimensions.FONT_SIZE_SMALL - 1,
            height: 1.5,
            color: context.clinicTextSecondary,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (stat != null) ...[
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
          ResponsiveText(
            stat!,
            fontSize: Dimensions.FONT_SIZE_SMALL - 1,
            fontWeight: FontWeight.w700,
            color: AppColors.clinicPrimaryContainer,
          ),
        ],
      ],
    );
  }
}
