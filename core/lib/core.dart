// Shared core for all apps in this monorepo.
//
// Import a single entry-point from apps:
// ```dart
// import 'package:core/core.dart';
// ```

// ── Auth (shared contract, no feature dependency) ──
export 'src/auth/auth_user.dart';
export 'src/auth/auth_repository.dart';

// ── DI / bootstrap ──
export 'src/dependency_injection/setup_locator.dart';
export 'src/dependency_injection/core_cubit_registrar.dart';

// ── Errors / usecases / helpers ──
export 'src/errors/failure_model.dart';
export 'src/usecases/usecase.dart';
export 'src/helpers/date_converter.dart';
// MVP-OFFLINE: restore with network_info.dart + setup_locator.dart + core/pubspec.yaml
// export 'src/network/network_info.dart';

// ── Services ──
export 'src/services/storage_service.dart';
export 'src/services/hive_storage_service.dart';
export 'src/services/hive_settings_extension.dart';
export 'src/services/print_service.dart';
export 'src/services/print_service_impl.dart';

// ── Routing / shell ──
export 'src/routing/routes.dart';
export 'src/routing/app_router.dart';
export 'src/routing/app_router_redirect.dart';
export 'src/routing/app_router_routes.dart';
export 'src/routing/animation_route.dart';
export 'src/routing/combined_transition_pages.dart';
export 'src/routing/error_page.dart';
export 'src/routing/navigation_service.dart';
export 'src/routing/placeholder_screen.dart';
export 'src/routing/go_router_refresh_stream.dart';
export 'src/routing/shell/main_shell_screen.dart';
export 'src/routing/shell/mobile_shell_layout.dart';
export 'src/routing/shell/widgets/header_logout_button.dart';
export 'src/routing/shell/widgets/user_profile_widget.dart';

// ── Shared cubits ──
export 'src/shared_cubits/app_auth_cubit/app_auth_cubit.dart';
export 'src/shared_cubits/autovalidate_mode/autovalidate_mode_cubit.dart';
export 'src/shared_cubits/password_visibility/password_visibility_cubit.dart';
export 'src/shared_cubits/password_visibility/password_visibility_state.dart';
export 'src/shared_cubits/theme_cubit/theme_cubit.dart';
export 'src/shared_cubits/theme_cubit/theme_state.dart';

// ── Theme ──
export 'src/theme/app_colors.dart';
export 'src/theme/color_extensions.dart';
export 'src/theme/color_schemes.dart';
export 'src/theme/dimensions.dart';
export 'src/theme/gradient_color_helper.dart';
export 'src/theme/theme_manager.dart';

// ── Responsive ──
export 'src/responsive/adaptive_layout.dart';
export 'src/responsive/adaptive_layout_resolver.dart';
export 'src/responsive/design_sizes.dart';
export 'src/responsive/fallback_layout_widget.dart';
export 'src/responsive/responsive_breakpoints.dart';
export 'src/responsive/responsive_extensions.dart';
export 'src/responsive/responsive_helper.dart';
export 'src/responsive/responsive_text.dart';
export 'src/responsive/responsive_text_styles.dart';
export 'src/responsive/responsive_font_size.dart';

// ── Custom widgets ──
export 'src/custom/animated_custom_dialog.dart';
export 'src/custom/app_button.dart';
export 'src/custom/app_dropdown_field.dart';
export 'src/custom/app_feature_header.dart';
export 'src/custom/app_feature_header_title.dart';
export 'src/custom/app_section_card.dart';
export 'src/custom/app_snack_bar.dart';
export 'src/custom/app_tab_button.dart';
export 'src/custom/app_text_field.dart';
export 'src/custom/custom_app_bar.dart';
export 'src/custom/custom_field_with_title.dart';
export 'src/custom/custom_ink_well.dart';
export 'src/custom/language_toggle_button.dart';
export 'src/custom/logout_dialog.dart';
export 'src/custom/not_found_screen.dart';
export 'src/custom/theme_toggle_button.dart';

// ── Utils ──
export 'src/utils/app_constants.dart';
export 'src/utils/app_validators.dart';
export 'src/utils/block_observer.dart';
export 'src/utils/images.dart';
export 'src/utils/logger.dart';
export 'src/utils/styles.dart';
export 'src/utils/typedefs.dart';
