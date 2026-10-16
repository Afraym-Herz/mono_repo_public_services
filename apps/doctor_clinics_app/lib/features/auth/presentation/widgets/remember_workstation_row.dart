import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:doctor_clinics_app/features/auth/presentation/widgets/remember_me_checkbox.dart';
import 'package:doctor_clinics_app/features/auth/presentation/widgets/workstation_badge.dart';

/// Remember-me checkbox (start) + workstation badge (end).
class RememberWorkstationRow extends StatelessWidget {
  const RememberWorkstationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 400),
      delay: Duration(milliseconds: 300),
      child: Row(
        children: [
          Expanded(child: RememberMeCheckbox()),
          WorkstationBadge(),
        ],
      ),
    );
  }
}
