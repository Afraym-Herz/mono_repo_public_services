import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/billing_toolbar_cubit.dart';
import '../helpers/billing_tab.dart';

/// Segmented strip selecting the visible accounts section.
class BillingTabs extends StatelessWidget {
  const BillingTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BillingToolbarCubit>();
    return FadeInUp(
      duration: const Duration(milliseconds: 350),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Dimensions.PADDING_SIZE_LARGE.w,
          0,
          Dimensions.PADDING_SIZE_LARGE.w,
          Dimensions.PADDING_SIZE_MEDIUM_BORDER.h,
        ),
        child: BlocBuilder<BillingToolbarCubit, BillingToolbarState>(
          buildWhen: (previous, current) => previous.tab != current.tab,
          builder: (context, state) => Row(
            children: [
              for (
                var index = 0;
                index < BillingTab.values.length;
                index++
              ) ...[
                Expanded(
                  child: AppTabButton(
                    label: BillingTab.values[index].labelKey.tr(),
                    icon: BillingTab.values[index].icon,
                    isActive: BillingTab.values[index] == state.tab,
                    onTap: () => cubit.tabChanged(BillingTab.values[index]),
                  ),
                ),
                if (index < BillingTab.values.length - 1)
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
