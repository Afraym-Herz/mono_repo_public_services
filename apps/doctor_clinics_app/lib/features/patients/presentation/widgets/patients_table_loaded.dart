import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';

import '../cubit/patient_list_cubit.dart';
import '../cubit/patient_toolbar_cubit.dart';
import '../helpers/open_patient_profile.dart';
import '../helpers/patient_list_filter.dart';
import '../helpers/patients_pagination.dart';
import 'patients_table_paged_view.dart';

/// Loaded register: applies the toolbar query/filter, then pages the result.
class PatientsTableLoaded extends StatelessWidget {
  const PatientsTableLoaded({super.key, required this.rows});

  final List<PatientListRow> rows;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PatientListCubit>();
    return BlocBuilder<PatientToolbarCubit, PatientToolbarState>(
      builder: (context, toolbar) {
        final pagination = context.read<PatientToolbarCubit>();
        final visible = PatientListFilter.apply(
          rows: rows,
          query: toolbar.query,
          filter: toolbar.filter,
        );
        final page = PatientsPagination.clampPage(toolbar.page, visible.length);
        final pageCount = PatientsPagination.pageCount(visible.length);
        _syncPage(pagination, page, visible.length);
        return PatientsTablePagedView(
          rows: PatientsPagination.slice(visible, page),
          totalCount: visible.length,
          page: page,
          onView: (row) => _openProfile(context, row),
          onDelete: cubit.delete,
          onPrevious: page > 0 ? pagination.previousPage : null,
          onNext: page < pageCount - 1
              ? () => pagination.nextPage(pageCount)
              : null,
        );
      },
    );
  }

  /// Pulls the cubit back in range when rows shrink below the current page.
  void _syncPage(PatientToolbarCubit cubit, int page, int totalCount) {
    if (page == cubit.state.page) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!cubit.isClosed) {
        cubit.clampPage(PatientsPagination.pageCount(totalCount));
      }
    });
  }

  Future<void> _openProfile(BuildContext context, PatientListRow row) async {
    final cubit = context.read<PatientListCubit>();
    final changed = await openPatientProfile(context, row.patient);
    if (changed && context.mounted && !cubit.isClosed) await cubit.load();
  }
}
