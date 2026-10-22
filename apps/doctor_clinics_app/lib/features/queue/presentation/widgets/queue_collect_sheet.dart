import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_clinics_app/features/queue/domain/entities/queue_ticket.dart';

class QueueCollectSheet extends StatefulWidget {
  const QueueCollectSheet({
    super.key,
    required this.ticket,
    required this.defaultFeePiasters,
  });

  final QueueTicket ticket;
  final int defaultFeePiasters;

  @override
  State<QueueCollectSheet> createState() => _QueueCollectSheetState();
}

class _QueueCollectSheetState extends State<QueueCollectSheet> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.defaultFeePiasters > 0
          ? (widget.defaultFeePiasters / 100).toStringAsFixed(0)
          : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'queue_row.collect.title'.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.clinicTextPrimary,
                ),
          ),
          SizedBox(height: Dimensions.paddingSizeDefault.h),
          AppTextField(
            controller: _controller,
            label: 'queue_row.collect.amount_label'.tr(),
            hint: '0',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE.h),
          AppButton(
            label: 'queue_row.collect.confirm'.tr(),
            onPressed: () => _confirm(context),
            height: Dimensions.CONTROL_HEIGHT.h,
          ),
        ],
      ),
    );
  }

  void _confirm(BuildContext context) {
    final text = _controller.text.trim();
    final pounds = double.tryParse(text);
    if (pounds == null || pounds <= 0) {
      AppSnackBar.showError(context, 'queue_row.collect.invalid_amount'.tr());
      return;
    }
    Navigator.of(context).pop((pounds * 100).round());
  }
}
