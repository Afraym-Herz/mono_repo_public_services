import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/operations/presentation/helpers/operation_form_controller.dart';

/// Required-test names collected before the operation is scheduled.
class OperationFormTestsField extends StatelessWidget {
  const OperationFormTestsField({super.key, required this.controller});

  final OperationFormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ValueListenableBuilder<List<String>>(
          valueListenable: controller.tests,
          builder: (context, tests, _) => tests.isEmpty
              ? Text(
                  'operation_form.tests_empty'.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: context.clinicTextSecondary,
                  ),
                )
              : Wrap(
                  spacing: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
                  runSpacing: Dimensions.PADDING_SIZE_EXTRA_SMALL.h,
                  children: [
                    for (final test in tests)
                      InputChip(
                        label: Text(test),
                        onDeleted: () => controller.removeTest(test),
                        deleteIcon: const Icon(Icons.close_rounded),
                      ),
                  ],
                ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        AppTextField(
          controller: controller.testName,
          label: 'operation_form.tests'.tr(),
          hint: 'operation_form.test_hint'.tr(),
          prefixIcon: Icons.science_outlined,
          textInputAction: TextInputAction.done,
          suffixIcon: IconButton.filledTonal(
            tooltip: 'operation_form.add_test'.tr(),
            onPressed: () => _addTest(context),
            icon: const Icon(Icons.add_rounded),
          ),
          onFieldSubmitted: (_) => _addTest(context),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        Text(
          'operation_form.test_help'.tr(),
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: context.clinicTextSecondary),
        ),
      ],
    );
  }

  void _addTest(BuildContext context) {
    final failure = controller.addTest();
    if (failure != null) AppSnackBar.showError(context, failure.tr());
  }
}
