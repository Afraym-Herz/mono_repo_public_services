import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/billing_toolbar_cubit.dart';
import '../helpers/billing_layout.dart';
import 'billing_search_input.dart';
import 'billing_search_trailing.dart';

/// Rounded search pill filtering the ledger and expense log.
class BillingSearchField extends StatelessWidget {
  const BillingSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BillingToolbarCubit>();
    return BlocBuilder<BillingToolbarCubit, BillingToolbarState>(
      buildWhen: (previous, current) =>
          previous.query != current.query ||
          previous.isSearching != current.isSearching,
      builder: (context, state) => Container(
        height: BillingLayout.filterControlHeight.h,
        decoration: BoxDecoration(
          color: context.clinicIsDark
              ? context.clinicContainer
              : context.cardColor,
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
              child: BillingSearchInput(
                controller: cubit.controller,
                onChanged: cubit.queryChanged,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
            BillingSearchTrailing(
              isSearching: state.isSearching,
              hasQuery: state.query.isNotEmpty,
              onClear: cubit.clearQuery,
            ),
          ],
        ),
      ),
    );
  }
}
