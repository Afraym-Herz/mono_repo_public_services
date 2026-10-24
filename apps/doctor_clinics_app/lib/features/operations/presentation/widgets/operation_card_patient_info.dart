import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_status_chip.dart';

/// Title, status and patient line inside an operation card head.
class OperationCardPatientInfo extends StatelessWidget {
  const OperationCardPatientInfo({super.key, required this.entry});

  final OperationEntry entry;

  @override
  Widget build(BuildContext context) {
    final patient = entry.patient;
    final details = [
      OperationFormat.age(patient, context),
      OperationFormat.gender(patient),
      if (patient != null)
        'operations_board.patient.file_short'.tr(
          namedArgs: {'file': OperationFormat.fileNumber(patient, context)},
        ),
    ].join(' • ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: ResponsiveText(
                entry.operation.name,
                fontSize: Dimensions.FONT_SIZE_DEFAULT,
                fontWeight: FontWeight.w700,
                color: context.clinicTextPrimary,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL.w),
            OperationStatusChip(status: entry.operation.status),
          ],
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h / 2),
        ResponsiveText(
          patient?.fullName ?? 'operations_board.patient.unknown'.tr(),
          fontSize: Dimensions.FONT_SIZE_SMALL,
          fontWeight: FontWeight.w600,
          color: context.clinicTextPrimary,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        ResponsiveText(
          details,
          fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
          color: context.clinicTextSecondary,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
