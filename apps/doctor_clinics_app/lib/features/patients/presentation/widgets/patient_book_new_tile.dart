import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Fallback tile when the search query matches nobody: book straight from the
/// sheet, where a brand-new patient can be registered before confirming.
class PatientBookNewTile extends StatelessWidget {
  const PatientBookNewTile({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL.w,
          vertical: Dimensions.PADDING_SIZE_SMALL.h,
        ),
        child: Row(
          children: [
            Icon(
              Icons.event_available_rounded,
              size: Dimensions.ICON_SIZE_SMALL.r,
              color: context.clinicAccent,
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'appointment_header.book'.tr(),
                    style: theme.bodyMedium?.copyWith(
                      color: context.clinicTextPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'appointment_sheet.no_patients'.tr(),
                    style: theme.bodySmall?.copyWith(
                      color: context.clinicTextSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
