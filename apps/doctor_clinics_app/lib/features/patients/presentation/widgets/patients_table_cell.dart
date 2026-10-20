import 'package:flutter/material.dart';

/// One flex-weighted column slot, aligned from the leading edge (right in RTL).
class PatientsTableCell extends StatelessWidget {
  const PatientsTableCell({
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
