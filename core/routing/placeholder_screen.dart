import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Temporary placeholder screen used inside [ShellRoute] while features are built.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'placeholder_screen'.tr(namedArgs: {'title': title}),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
