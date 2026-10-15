import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:core/src/custom/custom_app_bar.dart';
import 'package:core/src/custom/language_toggle_button.dart';
import 'package:core/src/custom/theme_toggle_button.dart';
import 'package:core/src/routing/shell/widgets/user_profile_widget.dart';
import 'package:core/src/routing/shell/widgets/header_logout_button.dart';
import 'package:core/src/theme/dimensions.dart';

/// Mobile/tablet layout for the app navigation shell.
///
/// Features a slide-out drawer and a [CustomAppBar] showing the app title.
///
/// TODO: replace the placeholder drawer body below with real navigation
/// items once the app's features/screens are defined.
class MobileShellLayout extends StatelessWidget {
  const MobileShellLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'app_name'.tr(), showDrawerButton: true),
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserProfileWidget(),
                const Spacer(),
                Row(
                  children: [
                    const LanguageToggleButton(),
                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                    const ThemeToggleButton(),
                    const Spacer(),
                    const HeaderLogoutButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: FadeInUp(
        delay: const Duration(milliseconds: 100),
        child: child,
      ),
    );
  }
}
