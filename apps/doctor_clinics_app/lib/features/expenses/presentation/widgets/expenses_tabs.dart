import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/expenses_toolbar_cubit.dart';
import '../helpers/expenses_section.dart';

/// Segmented strip selecting the visible expenses section.
class ExpensesTabs extends StatelessWidget {
  const ExpensesTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExpensesToolbarCubit>();
    return FadeInUp(
      duration: const Duration(milliseconds: 350),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Dimensions.PADDING_SIZE_LARGE.w,
          0,
          Dimensions.PADDING_SIZE_LARGE.w,
          Dimensions.PADDING_SIZE_MEDIUM_BORDER.h,
        ),
        child: BlocBuilder<ExpensesToolbarCubit, ExpensesToolbarState>(
          buildWhen: (previous, current) => previous.section != current.section,
          builder: (context, state) => Row(
            children: [
              for (
                var index = 0;
                index < ExpensesSection.values.length;
                index++
              ) ...[
                Expanded(
                  child: AppTabButton(
                    label: ExpensesSection.values[index].labelKey.tr(),
                    icon: ExpensesSection.values[index].icon,
                    isActive: ExpensesSection.values[index] == state.section,
                    onTap: () => cubit.sectionChanged(
                      ExpensesSection.values[index],
                    ),
                  ),
                ),
                if (index < ExpensesSection.values.length - 1)
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
