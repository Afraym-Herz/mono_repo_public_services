import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/patient_toolbar_cubit.dart';
import '../helpers/patient_filter.dart';
import 'patient_filter_chip.dart';

/// Filter chips bound to [PatientToolbarCubit].
///
/// Laid out with [Wrap] so the chips drop onto a second line instead of
/// overflowing on narrow windows.
class PatientFilterBar extends StatelessWidget {
  const PatientFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientToolbarCubit, PatientToolbarState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) => Wrap(
        spacing: Dimensions.PADDING_SIZE_SMALL.w,
        runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
        children: [
          for (final filter in PatientFilter.values)
            PatientFilterChip(
              filter: filter,
              isActive: filter == state.filter,
              onTap: () =>
                  context.read<PatientToolbarCubit>().filterChanged(filter),
            ),
        ],
      ),
    );
  }
}
