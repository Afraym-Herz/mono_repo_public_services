import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card_patient_info.dart';

/// Identity row at the head of an operation card.
class OperationCardHeader extends StatelessWidget {
  const OperationCardHeader({super.key, required this.entry});

  final OperationEntry entry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Dimensions.ICON_SIZE_LARGE.w,
          height: Dimensions.ICON_SIZE_LARGE.h,
          decoration: BoxDecoration(
            color: context.clinicContainer,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          ),
          child: Icon(
            Icons.medical_services_outlined,
            size: Dimensions.ICON_SIZE_SMALL.r,
            color: context.clinicPrimary,
          ),
        ),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
        Expanded(child: OperationCardPatientInfo(entry: entry)),
      ],
    );
  }
}
