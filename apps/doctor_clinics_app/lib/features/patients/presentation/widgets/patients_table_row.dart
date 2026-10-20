import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient_list_row.dart';

import '../helpers/patients_table_columns.dart';
import 'patient_balance_badge.dart';
import 'patient_blood_badge.dart';
import 'patient_file_age_cells.dart';
import 'patient_last_visit_cell.dart';
import 'patient_phone_cell.dart';
import 'patient_row_identity.dart';
import 'patient_row_quick_actions.dart';
import 'patients_table_cell.dart';

/// One register row: stored file, identity, demographics, contact, blood type,
/// last visit, balance and quick actions.
class PatientsTableRow extends StatelessWidget {
  const PatientsTableRow({super.key, required this.row, this.onDelete});

  final PatientListRow row;
  final ValueChanged<PatientListRow>? onDelete;

  @override
  Widget build(BuildContext context) {
    final patient = row.patient;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PatientsTableCell(
            flex: PatientsTableColumns.fileNumber,
            child: PatientFileNumberCell(patient: patient),
          ),
          PatientsTableCell(
            flex: PatientsTableColumns.name,
            child: PatientRowIdentity(patient: patient),
          ),
          PatientsTableCell(
            flex: PatientsTableColumns.ageGender,
            child: PatientAgeGenderCell(patient: patient),
          ),
          PatientsTableCell(
            flex: PatientsTableColumns.phone,
            child: PatientPhoneCell(patient: patient),
          ),
          PatientsTableCell(
            flex: PatientsTableColumns.bloodType,
            child: PatientBloodBadge(bloodType: patient.bloodType),
          ),
          PatientsTableCell(
            flex: PatientsTableColumns.lastVisit,
            child: PatientLastVisitCell(date: row.lastVisit),
          ),
          PatientsTableCell(
            flex: PatientsTableColumns.account,
            child: PatientBalanceBadge(debtPiasters: row.debtPiasters),
          ),
          PatientsTableCell(
            flex: PatientsTableColumns.actions,
            centered: true,
            child: PatientRowQuickActions(row: row, onDelete: onDelete),
          ),
        ],
      ),
    );
  }
}
