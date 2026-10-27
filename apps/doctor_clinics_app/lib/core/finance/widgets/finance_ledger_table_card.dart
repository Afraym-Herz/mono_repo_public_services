import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doctor_clinics_app/core/finance/domain/ledger_row.dart';

import 'finance_ledger_table.dart';
import 'finance_table_title.dart';

/// Bordered surface holding the ledger title and its table.
class FinanceLedgerTableCard extends StatelessWidget {
  const FinanceLedgerTableCard({
    super.key,
    required this.rows,
    required this.title,
    required this.icon,
    required this.countLabel,
    required this.emptyTitleKey,
    required this.emptyHintKey,
    this.onRowTap,
  });

  final List<LedgerRow> rows;
  final ValueChanged<LedgerRow>? onRowTap;
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
          FinanceTableTitle(title: title, icon: icon, countLabel: countLabel),
          Expanded(
            child: FinanceLedgerTable(
              rows: rows,
              onRowTap: onRowTap,
              emptyTitleKey: emptyTitleKey,
              emptyHintKey: emptyHintKey,
            ),
          ),
        ],
      ),
    );
  }
}
