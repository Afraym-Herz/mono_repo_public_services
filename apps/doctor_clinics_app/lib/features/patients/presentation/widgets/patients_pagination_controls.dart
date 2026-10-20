import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/patients_count_format.dart';

/// Previous / page / next controls. Pagination is disabled while the offline
/// MVP keeps the whole (small) register on one page.
class PatientsPaginationControls extends StatelessWidget {
  const PatientsPaginationControls({super.key});

  @override
  Widget build(BuildContext context) {
    final isRtl = Bidi.isRtlLanguage(context.locale.languageCode);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PageButton(
          icon: isRtl ? Icons.chevron_right : Icons.chevron_left,
          label: 'patients.table.previous'.tr(),
        ),
        const PatientsPageIndicator(),
        _PageButton(
          icon: isRtl ? Icons.chevron_left : Icons.chevron_right,
          label: 'patients.table.next'.tr(),
        ),
      ],
    );
  }
}

class PatientsPageIndicator extends StatelessWidget {
  const PatientsPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL.w,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.PADDING_SIZE_SMALL.w,
        vertical: Dimensions.PADDING_SIZE_BORDER.h,
      ),
      decoration: BoxDecoration(
        color: context.clinicNavActiveBackground,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
      ),
      child: ResponsiveText(
        PatientsCountFormat.count(1, context),
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: FontWeight.w700,
        color: context.clinicTextPrimary,
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  const _PageButton({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: null,
      icon: Icon(icon, size: Dimensions.ICON_SIZE_EXTRA_SMALL.r),
      label: ResponsiveText(
        label,
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
