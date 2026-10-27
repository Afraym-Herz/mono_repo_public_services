import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/cubit/operation_form_cubit.dart';

/// Cancel / save actions pinned below the operation form.
class OperationFormFooter extends StatelessWidget {
  const OperationFormFooter({
    super.key,
    required this.isEditing,
    required this.onCancel,
    required this.onSave,
  });

  final bool isEditing;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationFormCubit, OperationFormState>(
      builder: (context, state) {
        final saving = state.maybeMap(saving: (_) => true, orElse: () => false);
        return Row(
          children: [
            Expanded(
              child: AppButton(
                label: 'operation_form.cancel'.tr(),
                outlined: true,
                height: Dimensions.CONTROL_HEIGHT.h,
                onPressed: onCancel,
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(
              flex: 2,
              child: AppButton(
                label: isEditing
                    ? 'operation_form.update'.tr()
                    : 'operation_form.save'.tr(),
                icon: isEditing
                    ? Icons.save_outlined
                    : Icons.event_available_rounded,
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
