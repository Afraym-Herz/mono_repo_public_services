import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/domain/entities/operation_required_test.dart';
import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card.dart';

/// Scrollable stack of operation cards.
class OperationList extends StatelessWidget {
  const OperationList({
    super.key,
    required this.entries,
    required this.expandedId,
    required this.onToggle,
    required this.onToggleTest,
    required this.onComplete,
    required this.onCancel,
    required this.onEdit,
  });

  final List<OperationEntry> entries;
  final int? expandedId;
  final ValueChanged<int> onToggle;
  final void Function(OperationEntry, OperationRequiredTest) onToggleTest;
  final ValueChanged<OperationEntry> onComplete;
  final ValueChanged<OperationEntry> onCancel;
  final ValueChanged<OperationEntry> onEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (index, entry) in entries.indexed)
          FadeInUp(
            delay: Duration(milliseconds: 40 * index.clamp(0, 6)),
            duration: const Duration(milliseconds: 300),
            child: OperationCard(
              entry: entry,
              isExpanded: entry.operation.id == expandedId,
              onToggle: () => onToggle(entry.operation.id),
              onToggleTest: (test) => onToggleTest(entry, test),
              onComplete: () => onComplete(entry),
              onCancel: () => onCancel(entry),
              onEdit: () => onEdit(entry),
            ),
          ),
      ],
    );
  }
}
