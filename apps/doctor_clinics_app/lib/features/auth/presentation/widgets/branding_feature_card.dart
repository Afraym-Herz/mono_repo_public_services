import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/branding_panel_hover_cubit.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/branding_feature_card_body.dart';

/// White card with tinted icon tile, title, optional stat chip and body.
///
/// Owns a scoped [BrandingPanelHoverCubit] so hovering lifts the card on
/// desktop (CLAUDE.md §4: no `setState`).
class BrandingFeatureCard extends StatelessWidget {
  const BrandingFeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.stat,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? stat;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BrandingPanelHoverCubit(),
      child: BrandingFeatureCardBody(
        icon: icon,
        title: title,
        subtitle: subtitle,
        stat: stat,
      ),
    );
  }
}
