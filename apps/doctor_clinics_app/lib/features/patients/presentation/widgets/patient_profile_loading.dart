import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Placeholder shown while the patient profile is being resolved.
class PatientProfileLoading extends StatelessWidget {
  const PatientProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.PADDING_SIZE_EXTRA_LARGE.h,
      ),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
