import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patient_filter.dart';

/// One filter chip on the patients toolbar.
///
/// The active chip sits on the clinical teal surface with white text; the rest
/// stay on a white surface with a hairline border.
class PatientFilterChip extends StatelessWidget {
  const PatientFilterChip({
    super.key,
    required this.filter,
    required this.isActive,
    required this.onTap,
  });

  /// Filter this chip selects.
  final PatientFilter filter;

  /// Whether this chip currently filters the list.
  final bool isActive;

  /// Called when the chip is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r);
    return Material(
      color: isActive ? context.clinicSubmitButton : context.cardColor,
      borderRadius: radius,
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault.w,
            vertical: Dimensions.PADDING_SIZE_SMALL.h,
          ),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: isActive ? null : Border.all(color: context.clinicBorder),
          ),
          child: ResponsiveText(
            filter.labelKey.tr(),
            fontSize: Dimensions.FONT_SIZE_SMALL,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
            color: isActive ? AppColors.white : context.clinicTextSecondary,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
