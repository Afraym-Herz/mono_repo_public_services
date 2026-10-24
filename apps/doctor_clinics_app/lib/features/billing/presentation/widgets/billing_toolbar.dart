import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'billing_range_pills.dart';
import 'billing_search_field.dart';

/// Range pills plus the debounced search field.
class BillingToolbar extends StatelessWidget {
  const BillingToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    const ranges = BillingRangePills();

    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_LARGE.w,
          vertical: Dimensions.PADDING_SIZE_MEDIUM_BORDER.h,
        ),
        child: context.isMobileOrSmallTablet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ranges,
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
                  const BillingSearchField(),
                ],
              )
            : Row(
                children: [
                  ranges,
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                  const Expanded(child: BillingSearchField()),
                ],
              ),
      ),
    );
  }
}
