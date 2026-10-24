import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/features/billing/domain/entities/billing_ledger_row.dart';

import 'billing_ledger_table.dart';
import 'billing_table_title.dart';

/// Bordered surface holding the ledger title and its table.
class BillingLedgerTableCard extends StatelessWidget {
  const BillingLedgerTableCard({
    super.key,
    required this.rows,
    required this.title,
    required this.icon,
    required this.countLabel,
    required this.emptyTitleKey,
    required this.emptyHintKey,
  });

  final List<BillingLedgerRow> rows;
  final String title;
  final IconData icon;
  final String countLabel;
  final String emptyTitleKey;
  final String emptyHintKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_MEDIUM.r),
        border: Border.all(color: context.clinicBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          BillingTableTitle(title: title, icon: icon, countLabel: countLabel),
          Expanded(
            child: BillingLedgerTable(
              rows: rows,
              emptyTitleKey: emptyTitleKey,
              emptyHintKey: emptyHintKey,
            ),
          ),
        ],
      ),
    );
  }
}
