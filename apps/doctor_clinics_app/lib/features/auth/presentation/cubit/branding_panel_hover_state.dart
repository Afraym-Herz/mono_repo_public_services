import 'package:freezed_annotation/freezed_annotation.dart';

part 'branding_panel_hover_state.freezed.dart';

/// Hover state of one branding feature card (CLAUDE.md §4: `@freezed`).
@freezed
abstract class BrandingPanelHoverState with _$BrandingPanelHoverState {
  const factory BrandingPanelHoverState({@Default(false) bool hovered}) =
      _BrandingPanelHoverState;
}
