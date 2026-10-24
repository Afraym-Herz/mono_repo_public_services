import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/models/operation_info_item.dart';

/// Two-column grid of labelled operation values.
class OperationInfoGrid extends StatelessWidget {
  const OperationInfoGrid({super.key, required this.items});

  final List<OperationInfoItem> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final gap = Dimensions.PADDING_SIZE_SMALL.w;
        final columns = constraints.maxWidth < 420 ? 1 : 2;
        final width = (constraints.maxWidth - gap * (columns - 1)) / columns;
        return Wrap(
          spacing: gap,
          runSpacing: Dimensions.PADDING_SIZE_SMALL.h,
          children: [
            for (final item in items)
              SizedBox(
                width: width,
                child: _InfoValue(item: item),
              ),
          ],
        );
      },
    );
  }
}

class _InfoValue extends StatelessWidget {
  const _InfoValue({required this.item});

  final OperationInfoItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          item.icon,
          size: Dimensions.ICON_SIZE_EXTRA_SMALL.r,
          color: context.clinicTextSecondary,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ResponsiveText(
                item.label,
                fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                color: context.clinicTextSecondary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              ResponsiveText(
                item.value,
                fontSize: Dimensions.FONT_SIZE_SMALL,
                fontWeight: FontWeight.w600,
                color: context.clinicTextPrimary,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
