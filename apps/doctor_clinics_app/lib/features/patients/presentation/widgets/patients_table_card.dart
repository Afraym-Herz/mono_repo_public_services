import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';

import 'patients_table_empty.dart';
import 'patients_table_head.dart';
import 'patients_table_row.dart';

/// Bordered surface holding the sticky head and the scrollable rows.
class PatientsTableCard extends StatelessWidget {
  const PatientsTableCard({
    super.key,
    required this.rows,
    required this.onDelete,
  });

  final List<PatientListRow> rows;
  final ValueChanged<PatientListRow> onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
        border: Border.all(color: context.clinicBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const PatientsTableHead(),
          Expanded(
            child: rows.isEmpty
                ? const PatientsTableEmpty()
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: rows.length,
                    separatorBuilder: (_, _) =>
                        Divider(height: 1, color: context.clinicBorder),
                    itemBuilder: (context, index) =>
                        PatientsTableRow(row: rows[index], onDelete: onDelete),
                  ),
          ),
        ],
      ),
    );
  }
}
