import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctor_clinics_app/features/auth/presentation/cubit/branding_panel_hover_state.dart';

/// Scoped hover state for a branding feature card (no `setState`).
class BrandingPanelHoverCubit extends Cubit<BrandingPanelHoverState> {
  BrandingPanelHoverCubit() : super(const BrandingPanelHoverState());

  void enter() => emit(state.copyWith(hovered: true));
  void exit() => emit(state.copyWith(hovered: false));
}
