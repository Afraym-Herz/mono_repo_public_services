import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'patient_filter_bar.dart';
import 'patient_search_field.dart';

/// Head of the patients list: the debounced search field plus the filter chips.
///
/// Below the small-tablet breakpoint the chips drop under the search field
/// instead of overflowing.
class PatientsToolbar extends StatelessWidget {
  const PatientsToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE.w,
          vertical: Dimensions.PADDING_SIZE_SMALL.h,
        ),
        child: context.isMobileOrSmallTablet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const PatientSearchField(),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
                  const PatientFilterBar(),
                ],
              )
            : Row(
                children: [
                  const Expanded(child: PatientSearchField()),
                  SizedBox(width: Dimensions.PADDING_SIZE_LARGE.w),
                  const PatientFilterBar(),
                ],
              ),
      ),
    );
  }
}
