import 'package:flutter/material.dart';

/// Single source of truth for default text colours.
///
/// Only the colour is authored here — sizes, weights and the font family
/// stay on the Material defaults that `ThemeData` merges underneath, so
/// every `Text` that doesn't set its own colour resolves the right token
/// for the active brightness. Widgets should not hardcode a text colour.
TextTheme buildClinicalTextTheme({
  required Color primaryText,
  required Color secondaryText,
}) {
  TextStyle on(Color color) => TextStyle(color: color);

  return TextTheme(
    displayLarge: on(primaryText),
    displayMedium: on(primaryText),
    displaySmall: on(primaryText),
    headlineLarge: on(primaryText),
    headlineMedium: on(primaryText),
    headlineSmall: on(primaryText),
    titleLarge: on(primaryText),
    titleMedium: on(primaryText),
    titleSmall: on(primaryText),
    bodyLarge: on(primaryText),
    bodyMedium: on(primaryText),
    bodySmall: on(secondaryText),
    labelLarge: on(primaryText),
    labelMedium: on(secondaryText),
    labelSmall: on(secondaryText),
  );
}
