import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Read-only label + filled value block used by the patient profile.
class PatientProfileField extends StatelessWidget {
  const PatientProfileField({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.maxLines = 1,
  });

  final String label;
  final String value;
  final IconData? icon;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: Dimensions.ICON_SIZE_EXTRA_SMALL.r,
                color: context.clinicTextSecondary,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_BORDER.w),
            ],
            Flexible(
              child: ResponsiveText(
                label,
                fontSize: Dimensions.FONT_SIZE_SMALL,
                fontWeight: FontWeight.w600,
                color: context.clinicTextSecondary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: Dimensions.CONTROL_HEIGHT.h),
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_SMALL.w,
            vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
          ),
          decoration: BoxDecoration(
            color: context.clinicContainer,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
            border: Border.all(color: context.clinicBorder),
          ),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: ResponsiveText(
              value,
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              color: context.clinicTextPrimary,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
