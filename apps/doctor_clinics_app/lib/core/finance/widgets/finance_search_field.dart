import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/finance_layout.dart';
import 'finance_search_input.dart';
import 'finance_search_trailing.dart';

/// Rounded search pill shared by the finance workspaces.
class FinanceSearchField extends StatelessWidget {
  const FinanceSearchField({
    super.key,
    required this.controller,
    required this.query,
    required this.isSearching,
    required this.onChanged,
    required this.onClear,
    required this.hintKey,
  });

  final TextEditingController controller;
  final String query;
  final bool isSearching;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final String hintKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: FinanceLayout.filterControlHeight.h,
      decoration: BoxDecoration(
        color: context.clinicIsDark ? context.clinicContainer : context.cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
        border: Border.all(color: context.clinicBorder),
      ),
      child: Row(
        children: [
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
          Icon(
            Icons.search_rounded,
            size: Dimensions.ICON_SIZE_SMALL.r,
            color: context.clinicTextSecondary,
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          Expanded(
            child: FinanceSearchInput(
              controller: controller,
              hintKey: hintKey,
              onChanged: onChanged,
            ),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
          FinanceSearchTrailing(
            isSearching: isSearching,
            hasQuery: query.isNotEmpty,
            onClear: onClear,
          ),
        ],
      ),
    );
  }
}
