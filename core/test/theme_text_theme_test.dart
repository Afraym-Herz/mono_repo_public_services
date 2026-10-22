import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Default text colours must come from the theme (one source) and must differ
/// between light and dark mode.
void main() {
  group('AppColorSchemes text theme', () {
    test('light mode uses the light text tokens', () {
      final theme = AppColorSchemes.light;

      expect(theme.textTheme.displayLarge?.color, AppColors.clinicTextPrimary);
      expect(theme.textTheme.titleLarge?.color, AppColors.clinicTextPrimary);
      expect(theme.textTheme.bodyMedium?.color, AppColors.clinicTextPrimary);
      expect(theme.textTheme.labelLarge?.color, AppColors.clinicTextPrimary);
      expect(theme.textTheme.bodySmall?.color, AppColors.clinicTextSecondary);
      expect(theme.textTheme.labelSmall?.color, AppColors.clinicTextSecondary);
      expect(theme.iconTheme.color, AppColors.clinicTextPrimary);
    });

    test('dark mode uses the dark text tokens', () {
      final theme = AppColorSchemes.dark;

      expect(
        theme.textTheme.bodyMedium?.color,
        AppColors.clinicTextPrimaryDark,
      );
      expect(
        theme.textTheme.titleLarge?.color,
        AppColors.clinicTextPrimaryDark,
      );
      expect(
        theme.textTheme.bodySmall?.color,
        AppColors.clinicTextSecondaryDark,
      );
      expect(theme.iconTheme.color, AppColors.clinicTextPrimaryDark);
    });

    test('the two modes never share the same default text colour', () {
      final light = AppColorSchemes.light.textTheme.bodyMedium?.color;
      final dark = AppColorSchemes.dark.textTheme.bodyMedium?.color;

      expect(light, isNotNull);
      expect(dark, isNotNull);
      expect(light, isNot(equals(dark)));
    });

    test('only the colour is overridden — Material metrics survive the merge',
        () {
      final theme = AppColorSchemes.light;
      // `Theme.of` merges the Material geometry on top of the theme's colours.
      final localized = ThemeData.localize(
        theme,
        theme.typography.geometryThemeFor(ScriptCategory.englishLike),
      ).textTheme.bodyLarge;

      expect(localized?.fontSize, isNotNull);
      expect(localized?.fontWeight, isNotNull);
      expect(localized?.fontFamily, AppConstants.fontFamily);
      expect(localized?.color, AppColors.clinicTextPrimary);
    });

    testWidgets('an unstyled Text inherits the brightness-aware colour',
        (tester) async {
      Future<Color?> rendered(ThemeData theme) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: theme,
            home: Scaffold(body: Builder(builder: (_) => const Text('probe'))),
          ),
        );
        await tester.pumpAndSettle();
        return DefaultTextStyle.of(tester.element(find.text('probe')))
            .style
            .color;
      }

      final light = await rendered(AppColorSchemes.light);
      final dark = await rendered(AppColorSchemes.dark);

      expect(light, AppColors.clinicTextPrimary);
      expect(dark, AppColors.clinicTextPrimaryDark);
      expect(light, isNot(equals(dark)));
    });
  });
}
