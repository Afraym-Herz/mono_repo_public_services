import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/patients/domain/entities/patient.dart';

/// Shows a simple modal with the patient's key data when tapped in the booking sheet.
/// Uses light mode colors from AppColors so the dialog is consistent in both
/// light and dark modes.
Future<Patient?> showPatientDetailDialog(
  BuildContext context, {
  required Patient patient,
}) {
  return showGeneralDialog<Patient>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: AppColors.scrim,
    pageBuilder: (_, _, _) => _PatientDetailDialog(patient: patient),
  );
}

class _PatientDetailDialog extends StatelessWidget {
  final Patient patient;

  _PatientDetailDialog({required this.patient});

  @override
  Widget build(BuildContext context) {
    // Use light mode colors from AppColors for consistent appearance in both
    // light and dark modes.
    final lightSurface = AppColors.clinicSurfaceContainerLow;
    final lightText = AppColors.clinicTextPrimary;

    return Dialog(
      backgroundColor: lightSurface,
      surfaceTintColor: AppColors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: context.clinicBorder),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PatientHeader(
              patient: patient,
              lightSurface: lightSurface,
              lightText: lightText,
            ),
            const SizedBox(height: 20),
            _DetailRow(
              icon: Icons.phone,
              label: 'Phone',
              value: patient.phone ?? 'Not provided',
            ),
            _DetailRow(
              icon: Icons.bloodtype,
              label: 'Blood Type',
              value: patient.bloodType ?? 'Not specified',
            ),
            _DetailRow(
              icon: Icons.cake,
              label: 'Age',
              value: _ageString(patient.birthDate),
            ),
            _DetailRow(
              icon: Icons.location_on,
              label: 'Address',
              value: patient.address ?? 'Not available',
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  static String _ageString(DateTime? birthDate) {
    if (birthDate == null) return '—';
    final now = DateTime.now();
    var years = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      years--;
    }
    return years < 0 ? '—' : '$years yrs';
  }
}

class _PatientHeader extends StatelessWidget {
  _PatientHeader({
    required this.patient,
    required lightSurface,
    required lightText,
  });

  final Patient patient;
  Color lightSurface = AppColors.clinicSurfaceContainerLow;
  Color lightText = AppColors.clinicTextPrimary;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightSurface,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.clinicPrimaryContainer,
              child: Text(
                patient.fullName.isNotEmpty
                    ? patient.fullName.substring(0, 1).toUpperCase()
                    : '?',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient.fullName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'File No.: ${patient.fileNumber}',
                    style: const TextStyle(
                      color: Color(0xFFB2B2B2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  _DetailRow({
    required IconData icon,
    required String label,
    required String value,
  })  : _icon = icon,
        _label = label,
        _value = value;

  final IconData _icon;
  final String _label;
  final String _value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(_icon,
              size: 18,
              color: AppColors.clinicTextSecondary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _label,
              style: const TextStyle(
                color: Color(0xFF6E6E6E),
                fontSize: 10,
              ),
            ),
          ),
          Text(
            _value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF6E6E6E),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}