import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card_actions.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card_meta.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_finance_section.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_info_section.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_notes_section.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_patient_section.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_tests_section.dart';

/// Expanded content of an operation card.
class OperationCardDetails extends StatelessWidget {
  const OperationCardDetails({
    super.key,
    required this.entry,
    required this.onToggleTest,
    required this.onComplete,
    required this.onCancel,
    required this.onEdit,
  });

  final OperationEntry entry;
  final ValueChanged<OperationRequiredTest> onToggleTest;
  final VoidCallback onComplete;
  final VoidCallback onCancel;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Dimensions.PADDING_SIZE_SMALL.r,
        0,
        Dimensions.PADDING_SIZE_SMALL.r,
        Dimensions.PADDING_SIZE_SMALL.r,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(height: 1, color: context.clinicBorder),
          gap,
          OperationCardMeta(entry: entry),
          gap,
          OperationInfoSection(entry: entry),
          gap,
          OperationPatientSection(entry: entry),
          gap,
          OperationTestsSection(entry: entry, onToggle: onToggleTest),
          gap,
          OperationFinanceSection(entry: entry),
          gap,
          OperationNotesSection(entry: entry),
          gap,
          OperationCardActions(
            entry: entry,
            onComplete: onComplete,
            onCancel: onCancel,
            onEdit: onEdit,
          ),
        ],
      ),
    );
  }
}
