import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Greeting headline (`مرحبا <name>،`) with the small "on shift" status dot.
class HomeGreetingLine extends StatelessWidget {
  const HomeGreetingLine({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ResponsiveText(
            'home_greeting'.tr(namedArgs: {'name': name}),
            fontSize: Dimensions.FONT_SIZE_LARGE,
            fontWeight: FontWeight.w700,
            color: context.clinicTextPrimary,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
        Container(
          width: Dimensions.ICON_SIZE_VERY_SMALL.r,
          height: Dimensions.ICON_SIZE_VERY_SMALL.r,
          decoration: const BoxDecoration(
            color: AppColors.success,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
