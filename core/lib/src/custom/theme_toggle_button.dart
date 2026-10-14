import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:core/src/shared_cubits/theme_cubit/theme_cubit.dart';
import 'package:core/src/shared_cubits/theme_cubit/theme_state.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key, this.size});

  /// Diameter of the tap target. Defaults to 40.
  final double? size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.darkTheme;
        final scheme = Theme.of(context).colorScheme;
        final diameter = (size ?? 40).r;

        return Tooltip(
          message: isDark ? 'theme_light'.tr() : 'theme_dark'.tr(),
          child: InkWell(
            onTap: () => context.read<ThemeCubit>().toggleTheme(),
            borderRadius: BorderRadius.circular(diameter / 2),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: diameter,
              height: diameter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? scheme.primary.withValues(alpha: 0.15)
                    : scheme.primary.withValues(alpha: 0.10),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, anim) => ScaleTransition(
                  scale: anim,
                  child: FadeTransition(opacity: anim, child: child),
                ),
                child: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  key: ValueKey(isDark),
                  size: diameter * 0.52,
                  color: isDark ? scheme.primary : scheme.primary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
