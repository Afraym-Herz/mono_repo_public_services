import 'package:flutter/material.dart';

/// One labelled value inside an operation detail block.
class OperationInfoItem {
  const OperationInfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;
}
