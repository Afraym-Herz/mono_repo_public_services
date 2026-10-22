import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Inline dropdown editor matching [PatientProfileEditField]'s rhythm.
class PatientProfileEditDropdown<T> extends StatelessWidget {
  const PatientProfileEditDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.icon,
  });

  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return AppDropdownField<T>(
      label: label,
      value: value,
      items: items,
      onChanged: onChanged,
      prefixIcon: icon,
    );
  }
}
