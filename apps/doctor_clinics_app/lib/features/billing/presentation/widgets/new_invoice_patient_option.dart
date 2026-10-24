import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// One patient hit in the invoice picker: name plus file and phone.
class NewInvoicePatientOption extends StatelessWidget {
  const NewInvoicePatientOption({
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
    final theme = Theme.of(context).textTheme;
    final meta = [
      if (patient.fileNumber.isNotEmpty) patient.fileNumber,
      if ((patient.phone ?? '').isNotEmpty) patient.phone!,
    ].join(' • ');

    return Material(
      color: isSelected ? context.clinicInset : context.clinicContainer,
      borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      child: ListTile(
        onTap: onTap,
        dense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        ),
        leading: CircleAvatar(
          radius: Dimensions.ICON_SIZE_SMALL.r,
          backgroundColor: context.clinicPrimaryInk.withValues(
            alpha: context.clinicIsDark ? 0.18 : 0.12,
          ),
          child: Text(
            patient.fullName.trim().isEmpty ? '?' : patient.fullName.trim()[0],
            style: theme.labelSmall?.copyWith(
              color: context.clinicPrimaryInk,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          patient.fullName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.bodyMedium?.copyWith(
            color: context.clinicTextPrimary,
            fontWeight: isSelected ? FontWeight.bold : null,
          ),
        ),
        subtitle: meta.isEmpty
            ? null
            : Text(
                meta,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.bodySmall?.copyWith(
                  color: context.clinicTextSecondary,
                ),
              ),
        trailing: isSelected
            ? Icon(
                Icons.check_circle_rounded,
                color: context.clinicPrimaryInk,
                size: Dimensions.ICON_SIZE_SMALL.r,
              )
            : null,
      ),
    );
  }
}
