import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/finance/domain/finance_range.dart';
import 'package:doctor_clinics_app/core/finance/helpers/finance_format.dart';

/// Date-window pills shared by the finance workspaces.
class FinanceRangePills extends StatelessWidget {
  const FinanceRangePills({
    super.key,
    required this.range,
    required this.onChanged,
  });

  final FinanceRange range;
  final ValueChanged<FinanceRange> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Dimensions.PADDING_SIZE_SMALL.w,
      runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
      children: [
        for (final value in FinanceRange.values)
          IntrinsicWidth(
            child: AppTabButton(
              label: FinanceFormat.rangeLabel(value),
              isActive: value == range,
              onTap: () => onChanged(value),
            ),
          ),
      ],
    );
  }
}
