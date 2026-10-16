import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centers [child] in the constrained, scrollable auth column shared by
/// the login and first-run panels (see DESIGN (2).md).
class CenteredPanel extends StatelessWidget {
  const CenteredPanel({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: Dimensions.LOGIN_PANEL_MAX_WIDTH,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimensions.paddingSizeDefault.r),
          child: child,
        ),
      ),
    );
  }
}
