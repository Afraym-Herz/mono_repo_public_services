import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_range.dart';

import '../cubit/billing_toolbar_cubit.dart';
import '../helpers/billing_format.dart';

/// Date-window pills shown above the accounts sections.
class BillingRangePills extends StatelessWidget {
  const BillingRangePills({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BillingToolbarCubit>();
    return BlocBuilder<BillingToolbarCubit, BillingToolbarState>(
      buildWhen: (previous, current) => previous.range != current.range,
      builder: (context, state) => Wrap(
        spacing: Dimensions.PADDING_SIZE_SMALL.w,
        runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
        children: [
          for (final range in BillingRange.values)
            IntrinsicWidth(
              child: AppTabButton(
                label: BillingFormat.rangeLabel(range),
                isActive: range == state.range,
                onTap: () => cubit.rangeChanged(range),
              ),
            ),
        ],
      ),
    );
  }
}
