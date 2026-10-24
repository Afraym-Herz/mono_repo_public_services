import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card_details.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card_toggle.dart';

/// Collapsible operation row: summary head plus the full detail sections.
class OperationCard extends StatelessWidget {
  const OperationCard({
    super.key,
    required this.entry,
    required this.isExpanded,
    required this.onToggle,
    required this.onToggleTest,
    required this.onComplete,
    required this.onCancel,
    required this.onEdit,
  });

  final OperationEntry entry;
  final bool isExpanded;
  final VoidCallback onToggle;
  final ValueChanged<OperationRequiredTest> onToggleTest;
  final VoidCallback onComplete;
  final VoidCallback onCancel;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r);
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL.h),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: radius,
        border: Border.all(
          color: isExpanded ? context.clinicPrimary : context.clinicBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OperationCardToggle(
            entry: entry,
            isExpanded: isExpanded,
            onToggle: onToggle,
            radius: radius,
          ),
          if (isExpanded)
            OperationCardDetails(
              entry: entry,
              onToggleTest: onToggleTest,
              onComplete: onComplete,
              onCancel: onCancel,
              onEdit: onEdit,
            ),
        ],
      ),
    );
  }
}
