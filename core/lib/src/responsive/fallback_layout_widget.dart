import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FallbackLayoutWidget extends StatelessWidget {
  const FallbackLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'no_layout_provided'.tr(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
