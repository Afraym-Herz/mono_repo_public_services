import 'package:flutter/material.dart';

/// One flex-weighted billing table column slot.
class BillingTableCell extends StatelessWidget {
  const BillingTableCell({
    super.key,
    required this.flex,
    required this.child,
    this.centered = false,
  });

  final int flex;
  final Widget child;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: centered
            ? AlignmentDirectional.center
            : AlignmentDirectional.centerStart,
        child: child,
      ),
    );
  }
}
