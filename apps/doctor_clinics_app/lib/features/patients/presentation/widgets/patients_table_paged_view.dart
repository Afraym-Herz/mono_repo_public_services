import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';

import '../helpers/patients_pagination.dart';
import '../helpers/patients_table_columns.dart';
import 'patients_table_card.dart';
import 'patients_table_footer.dart';

/// Card plus footer for the current page of the filtered register.
class PatientsTablePagedView extends StatelessWidget {
  const PatientsTablePagedView({
    super.key,
    required this.rows,
    required this.totalCount,
    required this.page,
    required this.onView,
    required this.onDelete,
    this.onPrevious,
    this.onNext,
  });

  final List<PatientListRow> rows;
  final int totalCount;
  final int page;
  final ValueChanged<PatientListRow> onView;
  final ValueChanged<PatientListRow> onDelete;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: math.max(
                  constraints.maxWidth,
                  PatientsTableColumns.minWidth.w,
                ),
                height: constraints.maxHeight,
                child: PatientsTableCard(
                  rows: rows,
                  onView: onView,
                  onDelete: onDelete,
                ),
              ),
            ),
          ),
        ),
        PatientsTableFooter(
          from: rows.isEmpty ? 0 : page * PatientsPagination.pageSize + 1,
          to: page * PatientsPagination.pageSize + rows.length,
          totalCount: totalCount,
          page: page,
          onPrevious: onPrevious,
          onNext: onNext,
        ),
      ],
    );
  }
}
