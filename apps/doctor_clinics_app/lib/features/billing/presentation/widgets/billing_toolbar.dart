import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/finance/widgets/finance_range_pills.dart';
import 'package:doctor_clinics_app/core/finance/widgets/finance_search_field.dart';

import '../cubit/billing_toolbar_cubit.dart';

/// Range pills plus the debounced search field.
class BillingToolbar extends StatelessWidget {
  const BillingToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BillingToolbarCubit>();
    return BlocBuilder<BillingToolbarCubit, BillingToolbarState>(
      buildWhen: (previous, current) =>
          previous.range != current.range ||
          previous.query != current.query ||
          previous.isSearching != current.isSearching,
      builder: (context, state) {
        final ranges = FinanceRangePills(
          range: state.range,
          onChanged: cubit.rangeChanged,
        );
        final search = FinanceSearchField(
          controller: cubit.controller,
          query: state.query,
          isSearching: state.isSearching,
          onChanged: cubit.queryChanged,
          onClear: cubit.clearQuery,
          hintKey: 'billing.search_hint',
        );
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
                      SizedBox(
                        height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
                      ),
                      search,
                    ],
                  )
                : Row(
                    children: [
                      ranges,
                      SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                      Expanded(child: search),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
