import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_info_item.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_detail_block.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_info_grid.dart';

/// Patient identity and contact block of an expanded operation.
class OperationPatientSection extends StatelessWidget {
  const OperationPatientSection({super.key, required this.entry});

  final OperationEntry entry;

  @override
  Widget build(BuildContext context) {
    final patient = entry.patient;
    return OperationDetailBlock(
      title: 'operations_board.patient.title'.tr(),
      icon: Icons.person_outline_rounded,
      child: OperationInfoGrid(
        items: [
          OperationInfoItem(
            icon: Icons.folder_outlined,
            label: 'operations_board.patient.file_number'.tr(),
            value: OperationFormat.fileNumber(patient, context),
          ),
          OperationInfoItem(
            icon: Icons.cake_outlined,
            label: 'operations_board.patient.age'.tr(),
            value: OperationFormat.age(patient, context),
          ),
          OperationInfoItem(
            icon: Icons.wc_rounded,
            label: 'operations_board.patient.gender'.tr(),
            value: OperationFormat.gender(patient),
          ),
          OperationInfoItem(
            icon: Icons.bloodtype_outlined,
            label: 'operations_board.patient.blood_type'.tr(),
            value: patient?.bloodType ?? 'operations_board.patient.none'.tr(),
          ),
          OperationInfoItem(
            icon: Icons.phone_outlined,
            label: 'operations_board.patient.phone'.tr(),
            value: patient?.phone ?? 'operations_board.patient.none'.tr(),
          ),
          if (patient?.notes != null && patient!.notes!.trim().isNotEmpty)
            OperationInfoItem(
              icon: Icons.edit_note_rounded,
              label: 'operations_board.patient.notes'.tr(),
              value: patient.notes!,
            ),
        ],
      ),
    );
  }
}
