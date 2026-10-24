import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_format.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_info_item.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_detail_block.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_info_grid.dart';

/// Scheduled date, time, surgeon and operation number.
class OperationInfoSection extends StatelessWidget {
  const OperationInfoSection({super.key, required this.entry});

  final OperationEntry entry;

  @override
  Widget build(BuildContext context) {
    final surgeon = entry.operation.surgeonName;
    return OperationDetailBlock(
      title: 'operations_board.info.title'.tr(),
      icon: Icons.assignment_outlined,
      child: OperationInfoGrid(
        items: [
          OperationInfoItem(
            icon: Icons.tag_rounded,
            label: 'operations_board.info.number'.tr(),
            value: '#${OperationFormat.count(entry.operation.id, context)}',
          ),
          OperationInfoItem(
            icon: Icons.event_outlined,
            label: 'operations_board.info.date'.tr(),
            value: OperationFormat.date(entry.operation.scheduledDate, context),
          ),
          OperationInfoItem(
            icon: Icons.schedule_outlined,
            label: 'operations_board.info.time'.tr(),
            value: OperationFormat.time(entry.operation, context),
          ),
          OperationInfoItem(
            icon: Icons.person_outline_rounded,
            label: 'operations_board.info.surgeon'.tr(),
            value: surgeon == null || surgeon.trim().isEmpty
                ? 'operations_board.info.unassigned'.tr()
                : surgeon,
          ),
        ],
      ),
    );
  }
}
