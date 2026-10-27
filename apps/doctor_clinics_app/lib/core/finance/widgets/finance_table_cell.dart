import 'package:flutter/material.dart';

/// One flex-weighted billing table column slot.
class FinanceTableCell extends StatelessWidget {
  const FinanceTableCell({
    super.key,
    required this.flex,
    required this.child,
    this.alignment = AlignmentDirectional.centerStart,
  });

  final int flex;
  final Widget child;
  final AlignmentDirectional alignment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: alignment,
        child: child,
      ),
    );
  }
}
