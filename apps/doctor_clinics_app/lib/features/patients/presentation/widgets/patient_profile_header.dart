import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../cubit/patient_cubit.dart';
import 'patient_file_number_pill.dart';

/// Title bar of the patient profile modal: section label, file number, close.
class PatientProfileHeader extends StatelessWidget {
  const PatientProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientCubit, PatientState>(
      builder: (context, state) {
        final fileNumber = state.maybeMap(
          patientDetail: (detail) => detail.patient.fileNumber,
          orElse: () => null,
        );
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_LARGE.w,
            vertical: Dimensions.PADDING_SIZE_SMALL.h,
          ),
          child: Row(
            children: [
              Icon(
                Icons.badge_outlined,
                size: Dimensions.ICON_SIZE_DEFAULT.r,
                color: context.clinicAccent,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              Expanded(
                child: ResponsiveText(
                  'patient_profile.title'.tr(),
                  fontWeight: FontWeight.w700,
                  color: context.clinicTextPrimary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (fileNumber != null && fileNumber.isNotEmpty) ...[
                SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
                Flexible(child: PatientFileNumberPill(fileNumber: fileNumber)),
              ],
              Tooltip(
                message: 'patient_profile.close'.tr(),
                child: IconButton(
                  icon: const Icon(Icons.close_rounded),
                  color: context.clinicTextSecondary,
                  onPressed: () => context.canPop()
                      ? context.pop()
                      : context.go(Routes.patients),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
