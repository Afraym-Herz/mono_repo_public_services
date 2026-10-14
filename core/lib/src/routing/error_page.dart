import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Error page rendered by [GoRouter] when navigation fails.
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'page_not_found_with_error'.tr(
            namedArgs: {'error': error?.toString() ?? ''},
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
