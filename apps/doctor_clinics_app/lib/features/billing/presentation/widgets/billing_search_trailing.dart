import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Trailing control of the billing search pill.
class BillingSearchTrailing extends StatelessWidget {
  const BillingSearchTrailing({
    super.key,
    required this.isSearching,
    required this.hasQuery,
    required this.onClear,
  });

  final bool isSearching;
  final bool hasQuery;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    if (isSearching) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
        ),
        child: SizedBox(
          width: Dimensions.ICON_SIZE_SMALL.r,
          height: Dimensions.ICON_SIZE_SMALL.r,
          child: const CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    if (!hasQuery) return SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w);

    return InkWell(
      onTap: onClear,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        child: Icon(
          Icons.close_rounded,
          size: Dimensions.ICON_SIZE_SMALL.r,
          color: context.clinicTextSecondary,
        ),
      ),
    );
  }
}
