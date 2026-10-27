import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'patients_page_indicator.dart';

/// Previous / page / next controls for the paged patients register.
class PatientsPaginationControls extends StatelessWidget {
  const PatientsPaginationControls({
    super.key,
    required this.page,
    required this.pageCount,
    this.onPrevious,
    this.onNext,
  });

  /// Zero-based current page.
  final int page;

  /// Total number of pages; 0 when the register has no matching rows.
  final int pageCount;

  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final isRtl = Bidi.isRtlLanguage(context.locale.languageCode);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PageButton(
          icon: isRtl ? Icons.chevron_right : Icons.chevron_left,
          label: 'patients.table.previous'.tr(),
          onPressed: onPrevious,
        ),
        PatientsPageIndicator(page: page, pageCount: pageCount),
        _PageButton(
          icon: isRtl ? Icons.chevron_left : Icons.chevron_right,
          label: 'patients.table.next'.tr(),
          onPressed: onNext,
        ),
      ],
    );
  }
}

class _PageButton extends StatelessWidget {
  const _PageButton({required this.icon, required this.label, this.onPressed});

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: Dimensions.ICON_SIZE_EXTRA_SMALL.r),
      label: ResponsiveText(
        label,
        fontSize: Dimensions.FONT_SIZE_SMALL,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
