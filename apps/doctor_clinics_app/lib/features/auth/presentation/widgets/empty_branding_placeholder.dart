import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Reserved 2/3 canvas — intentionally empty.
///
/// Future branding (clinic hero, feature cards) goes here. Tonal gradient
/// only, so the split ratio stays visible without implying finished design.
class EmptyBrandingPlaceholder extends StatelessWidget {
  const EmptyBrandingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO(branding): clinic hero + feature cards (DESIGN reference left).
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [context.clinicContainer, context.clinicBackground],
        ),
      ),
    );
  }
}
