import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentQueueNumber extends StatelessWidget {
  const AppointmentQueueNumber({super.key, required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.ICON_SIZE_SMALL.r * 2.4,
      height: Dimensions.ICON_SIZE_SMALL.r * 2.4,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.clinicPrimary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      ),
      child: Text(
        number,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: AppColors.clinicPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
