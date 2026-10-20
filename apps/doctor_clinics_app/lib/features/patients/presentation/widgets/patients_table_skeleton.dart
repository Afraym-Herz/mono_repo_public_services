import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patients_table_columns.dart';
import 'patient_skeleton_cell.dart';
import 'patients_table_head.dart';

/// Placeholder table shown while the register loads.
class PatientsTableSkeleton extends StatelessWidget {
  const PatientsTableSkeleton({super.key});

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
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 6,
              separatorBuilder: (_, _) =>
                  Divider(height: 1, color: context.clinicBorder),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_SMALL.w,
                  vertical: Dimensions.PADDING_SIZE_SMALL.h,
                ),
                child: const Row(
                  children: [
                    PatientSkeletonCell(
                      flex: PatientsTableColumns.fileNumber,
                    ),
                    PatientSkeletonCell(
                      flex: PatientsTableColumns.name,
                      factor: 0.75,
                    ),
                    PatientSkeletonCell(
                      flex: PatientsTableColumns.ageGender,
                      factor: 0.6,
                    ),
                    PatientSkeletonCell(
                      flex: PatientsTableColumns.phone,
                      factor: 0.7,
                    ),
                    PatientSkeletonCell(
                      flex: PatientsTableColumns.bloodType,
                      factor: 0.4,
                    ),
                    PatientSkeletonCell(
                      flex: PatientsTableColumns.lastVisit,
                      factor: 0.6,
                    ),
                    PatientSkeletonCell(
                      flex: PatientsTableColumns.account,
                      factor: 0.7,
                    ),
                    PatientSkeletonCell(
                      flex: PatientsTableColumns.actions,
                      factor: 0.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
