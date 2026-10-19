import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Brand gradient stops for the auth branding canvas.
///
/// App-owned on purpose: these stops describe this app's login / onboarding
/// artwork, so they stay out of `core`'s shared `AppColors` palette. Per
/// CLAUDE.md §5 this file is the single declared home for the literals — widget
/// code must reference these tokens instead of inlining hex values.
const List<Color> brandingDarkGradientStops = <Color>[
  AppColors.clinicBackgroundDark, // deep navy base
  AppColors.clinicSurfaceContainerDark, // slate mid
  Color(0xFF17343F), // teal deep end
  Color(0xFF253B52), // indigo edge
];

/// Light-canvas counterpart of [brandingDarkGradientStops].
const List<Color> brandingLightGradientStops = <Color>[
  AppColors.white, // crisp start
  Color(0xFFEAF1FE), // soft cool blue
  Color(0xFFDFF3EF), // soft clinic teal end
  Color(0xFFE9E5FB), // lavender hint
];

/// Stop positions shared by both brand gradient palettes.
const List<double> brandingGradientStops = <double>[0.0, 0.38, 0.7, 1.0];
