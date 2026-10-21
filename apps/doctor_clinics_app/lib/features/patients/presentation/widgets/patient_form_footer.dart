import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/patient_form_cubit.dart';

/// Cancel / save actions pinned below the patient form.
class PatientFormFooter extends StatelessWidget {
  const PatientFormFooter({
    super.key,
    required this.onCancel,
    required this.onSave,
  });

  final VoidCallback onCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientFormCubit, PatientFormState>(
      builder: (context, state) {
        final saving = state.maybeMap(saving: (_) => true, orElse: () => false);
        return Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'patient_form.cancel'.tr(),
                outlined: true,
                height: Dimensions.CONTROL_HEIGHT.h,
                onPressed: onCancel,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(
              flex: 2,
              child: AppButton(
                label: 'patient_form.save'.tr(),
                icon: Icons.person_add_alt_1_rounded,
                height: Dimensions.CONTROL_HEIGHT.h,
                isLoading: saving,
                onPressed: saving ? null : onSave,
              ),
            ),
          ],
        );
      },
    );
  }
}
