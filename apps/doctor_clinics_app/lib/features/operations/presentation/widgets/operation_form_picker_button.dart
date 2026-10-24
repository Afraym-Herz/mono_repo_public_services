import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Labelled outlined button used for the date/time pickers.
class OperationFormPickerButton extends StatelessWidget {
  const OperationFormPickerButton({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: context.clinicTextSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        AppButton(
          label: value,
          icon: icon,
          outlined: true,
          height: Dimensions.CONTROL_HEIGHT.h,
          onPressed: onTap,
        ),
      ],
    );
  }
}
