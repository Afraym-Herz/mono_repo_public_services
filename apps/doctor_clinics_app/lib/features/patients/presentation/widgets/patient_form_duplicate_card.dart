import 'package:animate_do/animate_do.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';
import 'package:doctor_clinics_app/features/patients/domain/helpers/patient_name_match.dart';
import 'package:doctor_clinics_app/features/patients/presentation/cubit/patient_name_matches_cubit.dart';
import 'package:doctor_clinics_app/features/patients/presentation/helpers/open_registered_patient.dart';
import 'patient_suggestion_row.dart';

/// "Already registered" card of the new-patient form.
class PatientFormDuplicateCard extends StatelessWidget {
  const PatientFormDuplicateCard({super.key});

  @override
  Widget build(BuildContext context) {
    final query = context.select<PatientNameMatchesCubit, String>(
      (cubit) => cubit.state.visibleQuery,
    );
    final matches = context.select<PatientNameMatchesCubit, List<Patient>>(
      (cubit) => cubit.state.visibleMatches,
    );
    if (matches.isEmpty) return const SizedBox.shrink();
    return FadeInUp(
      duration: const Duration(milliseconds: 160),
      child: Material(
        color: context.cardColor,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          side: BorderSide(color: context.clinicBorder),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 260.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
                  child: Text(
                    'patient_form.exists_hint'.tr(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.clinicTextSecondary,
                    ),
                  ),
                ),
                for (final patient in matches)
                  PatientSuggestionRow(
                    patient: patient,
                    trailing: Icon(
                      Icons.open_in_new_rounded,
                      size: Dimensions.ICON_SIZE_SMALL.r,
                      color: context.clinicTextSecondary,
                    ),
                    onTap: () => openRegisteredPatient(
                      context,
                      patient,
                      exact:
                          PatientNameMatch.rank(query, patient) ==
                          PatientNameRank.exact,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
