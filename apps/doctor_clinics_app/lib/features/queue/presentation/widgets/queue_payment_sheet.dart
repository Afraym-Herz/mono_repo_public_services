import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';
import '../helpers/queue_money_input.dart';
import 'queue_payment_form.dart';

/// Finishes a visit or collects a late payment. The deposit is read-only and
/// the cash field is optional.
class QueuePaymentSheet extends StatefulWidget {
  const QueuePaymentSheet({
    super.key,
    required this.ticket,
    this.isFinish = false,
  });

  final QueueTicket ticket;
  final bool isFinish;

  @override
  State<QueuePaymentSheet> createState() => _QueuePaymentSheetState();
}

class _QueuePaymentSheetState extends State<QueuePaymentSheet> {
  late final TextEditingController _deposit;
  final TextEditingController _paidNow = TextEditingController();

  @override
  void initState() {
    super.initState();
    _deposit = TextEditingController(
      text: QueueMoneyInput.poundsText(widget.ticket.depositPiasters),
    );
  }

  @override
  void dispose() {
    _deposit.dispose();
    _paidNow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.SETTINGS_PANEL_MAX_WIDTH.w,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE.w),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
      ),
      child: QueuePaymentForm(
        isFinish: widget.isFinish,
        deposit: _deposit,
        paidNow: _paidNow,
        onConfirm: () => _confirm(context),
      ),
    );
  }

  void _confirm(BuildContext context) {
    final piasters = QueueMoneyInput.tryParsePiasters(_paidNow.text);
    if (piasters == null) {
      AppSnackBar.showError(context, 'queue_row.payment.invalid_amount'.tr());
      return;
    }
    Navigator.of(context).pop(piasters);
  }
}
