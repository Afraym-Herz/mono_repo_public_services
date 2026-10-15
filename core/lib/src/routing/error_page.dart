import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Error page rendered by [GoRouter] when navigation fails.
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        delay: const Duration(milliseconds: 100),
        child: Center(
          child: Text(
            'page_not_found_with_error'.tr(
              namedArgs: {'error': error?.toString() ?? ''},
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
