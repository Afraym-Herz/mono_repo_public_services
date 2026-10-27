import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/operations/presentation/models/operation_entry.dart';
import 'package:doctor_clinics_app/features/operations/presentation/widgets/operation_card.dart';

/// Scrollable stack of operation cards.
class OperationList extends StatelessWidget {
  const OperationList({
    super.key,
    required this.entries,
    required this.onOpenDetails,
  });

  final List<OperationEntry> entries;
  final ValueChanged<OperationEntry> onOpenDetails;

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
              onOpenDetails: () => onOpenDetails(entry),
            ),
          ),
      ],
    );
  }
}
