import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_filter.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_filter_chip.dart';

/// Status tabs above the operations list with live counts.
class OperationFilterBar extends StatelessWidget {
  const OperationFilterBar({
    super.key,
    required this.counts,
    required this.selected,
    required this.onSelected,
  });

  final Map<OperationFilter, int> counts;
  final OperationFilter selected;
  final ValueChanged<OperationFilter> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_EXTRA_SMALL.h / 2,
      children: [
        for (final filter in OperationFilter.values)
          OperationFilterChip(
            filter: filter,
            count: counts[filter] ?? 0,
            isActive: filter == selected,
            onTap: () => onSelected(filter),
          ),
      ],
    );
  }
}
