import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key, this.size});

  /// Diameter of the tap target. Defaults to 40.
  final double? size;

  @override
  Widget build(BuildContext context) {
    final isAr = context.locale.languageCode == 'ar';
    final scheme = Theme.of(context).colorScheme;
    final diameter = (size ?? 40).r;

    return Tooltip(
      message: isAr ? 'English' : 'العربية',
      child: InkWell(
        onTap: () {
          if (isAr) {
            context.setLocale(const Locale('en'));
          } else {
            context.setLocale(const Locale('ar'));
          }
        },
        borderRadius: BorderRadius.circular(diameter / 2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          width: diameter,
          height: diameter,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: scheme.primary.withValues(alpha: 0.12),
          ),
          child: Text(
            isAr ? 'EN' : 'ع',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: scheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
