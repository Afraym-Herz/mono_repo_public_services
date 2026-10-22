import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

class AppointmentPatientOption extends StatelessWidget {
  const AppointmentPatientOption({
    super.key,
    required this.patient,
    required this.isSelected,
    required this.onTap,
  });

  final Patient patient;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? AppColors.clinicSurfaceContainerLow
          : context.clinicContainer,
      borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL.r),
          child: Row(
            children: [
              CircleAvatar(
                radius: Dimensions.ICON_SIZE_SMALL.r,
                backgroundColor: AppColors.clinicPrimary.withValues(
                  alpha: 0.12,
                ),
                child: Text(
                  _initial(patient.fullName),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.clinicPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
              Expanded(
                child: Text(
                  patient.fullName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.clinicTextPrimary,
                    fontWeight: isSelected ? FontWeight.bold : null,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.clinicPrimary,
                  size: Dimensions.ICON_SIZE_SMALL.r,
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _initial(String name) {
    final trimmed = name.trim();
    return trimmed.isEmpty ? '?' : trimmed.characters.first;
  }
}
