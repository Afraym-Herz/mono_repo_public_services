import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_date_field.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_form_time_field.dart';

/// Date + time row; stacks on narrow widths.
class OperationFormScheduleFields extends StatelessWidget {
  const OperationFormScheduleFields({super.key, required this.controller});

  final OperationFormController controller;

  @override
  Widget build(BuildContext context) {
    final date = OperationFormDateField(controller: controller);
    final time = OperationFormTimeField(controller: controller);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 420) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              date,
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
              time,
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: date),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(child: time),
          ],
        );
      },
    );
  }
}
