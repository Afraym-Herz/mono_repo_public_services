import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/patient_toolbar_cubit.dart';
import 'patient_search_input.dart';
import 'patient_search_trailing.dart';

/// Rounded search pill at the head of the patients toolbar.
///
/// Reads [PatientToolbarCubit] directly, so the trailing spinner runs for
/// exactly the 500ms debounce window (`isSearching`) and the clear button
/// appears as soon as the debounced query exists.
class PatientSearchPill extends StatelessWidget {
  const PatientSearchPill({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PatientToolbarCubit>();
    return BlocBuilder<PatientToolbarCubit, PatientToolbarState>(
      buildWhen: (previous, current) =>
          previous.query != current.query ||
          previous.isSearching != current.isSearching,
      builder: (context, state) => Container(
        height: Dimensions.CONTROL_HEIGHT.h,
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
              child: PatientSearchInput(
                controller: cubit.controller,
                onChanged: cubit.queryChanged,
                onTap: cubit.showSuggestions,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
            PatientSearchTrailing(
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
