import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Green up-trend indicator, e.g. `▲ +١٢٪ عن أمس`.
class HomeStatTrendPill extends StatelessWidget {
  const HomeStatTrendPill({super.key, required this.label});

  /// Already-localized trend caption.
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.arrow_upward_rounded,
          size: Dimensions.ICON_SIZE_SMALL.r,
          color: AppColors.success,
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w / 2),
        ResponsiveText(
          label,
          fontSize: Dimensions.FONT_SIZE_SMALL,
          fontWeight: FontWeight.w700,
          color: AppColors.success,
          maxLines: 1,
        ),
      ],
    );
  }
}
