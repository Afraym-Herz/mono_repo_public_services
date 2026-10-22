import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';

import '../cubit/patient_list_cubit.dart';
import '../cubit/patient_toolbar_cubit.dart';
import '../helpers/open_patient_profile.dart';
import '../helpers/patient_list_filter.dart';
import '../helpers/patients_table_columns.dart';
import 'patients_table_card.dart';
import 'patients_table_footer.dart';

/// Loaded register: applies the toolbar query/filter and scrolls horizontally
/// when the window is narrower than the table's minimum width.
class PatientsTableLoaded extends StatelessWidget {
  const PatientsTableLoaded({super.key, required this.rows});

  final List<PatientListRow> rows;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PatientListCubit>();
    return BlocBuilder<PatientToolbarCubit, PatientToolbarState>(
      builder: (context, toolbar) {
        final visible = PatientListFilter.apply(
          rows: rows,
          query: toolbar.query,
          filter: toolbar.filter,
        );
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
                      rows: visible,
                      onView: (row) async {
                        final changed = await openPatientProfile(
                          context,
                          row.patient,
                        );
                        if (changed && context.mounted && !cubit.isClosed) {
                          await cubit.load();
                        }
                      },
                      onDelete: cubit.delete,
                    ),
                  ),
                ),
              ),
            ),
            PatientsTableFooter(
              visibleCount: visible.length,
              totalCount: rows.length,
            ),
          ],
        );
      },
    );
  }
}
