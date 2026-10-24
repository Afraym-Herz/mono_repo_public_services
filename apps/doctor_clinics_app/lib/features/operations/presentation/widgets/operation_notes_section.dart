import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_detail_block.dart';

/// Free-text operation notes (preparation, surgeon remarks, follow-up).
class OperationNotesSection extends StatelessWidget {
  const OperationNotesSection({super.key, required this.entry});

  final OperationEntry entry;

  @override
  Widget build(BuildContext context) {
    final notes = entry.operation.notes;
    return OperationDetailBlock(
      title: 'operations_board.notes.title'.tr(),
      icon: Icons.edit_note_rounded,
      child: ResponsiveText(
        notes == null || notes.trim().isEmpty
            ? 'operations_board.notes.empty'.tr()
            : notes,
        fontSize: Dimensions.FONT_SIZE_SMALL,
        color: notes == null || notes.trim().isEmpty
            ? context.clinicTextSecondary
            : context.clinicTextPrimary,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
