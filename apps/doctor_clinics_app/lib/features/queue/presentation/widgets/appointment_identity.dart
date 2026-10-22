import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/appointment_list_item.dart';

class AppointmentIdentity extends StatelessWidget {
  const AppointmentIdentity({super.key, required this.item});

  final AppointmentListItem item;

  @override
  Widget build(BuildContext context) {
    final meta = [
      if (item.fileNumber != null && item.fileNumber!.isNotEmpty)
        item.fileNumber!,
      if (item.patientPhone != null && item.patientPhone!.isNotEmpty)
        item.patientPhone!,
    ].join(' · ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          item.patientName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.clinicTextPrimary,
          ),
        ),
        if (meta.isNotEmpty) ...[
          SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h),
          Text(
            meta,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: context.clinicTextSecondary,
              fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL.sp,
            ),
          ),
        ],
      ],
    );
  }
}
