import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/patient.dart';

/// One patient hit in the suggestions; the whole row triggers [onTap].
class PatientSuggestionRow extends StatelessWidget {
  const PatientSuggestionRow({
    super.key,
    required this.patient,
    required this.onTap,
    this.trailing,
  });

  final Patient patient;
  final VoidCallback onTap;

  /// Row affordance; defaults to the book-appointment action.
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final trimmed = patient.fullName.trim();
    final meta = [
      if (patient.fileNumber.isNotEmpty) patient.fileNumber,
      if ((patient.phone ?? '').isNotEmpty) patient.phone!,
    ].join(' • ');

    return ListTile(
      onTap: onTap,
      dense: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
      ),
      leading: CircleAvatar(
        radius: Dimensions.ICON_SIZE_EXTRA_SMALL.r,
        backgroundColor: context.clinicAccent.withValues(alpha: 0.15),
        child: Text(
          trimmed.isEmpty ? '?' : trimmed.characters.first,
          style: theme.labelSmall?.copyWith(
            color: context.clinicAccent,
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
          fontWeight: FontWeight.w600,
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
      trailing:
          trailing ??
          Tooltip(
            message: 'patients.table.book'.tr(),
            child: Icon(
              Icons.event_available_rounded,
              size: Dimensions.ICON_SIZE_SMALL.r,
              color: context.clinicAccent,
            ),
          ),
    );
  }
}
