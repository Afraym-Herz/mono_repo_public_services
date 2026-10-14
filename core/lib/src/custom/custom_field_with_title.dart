import 'package:easy_localization/easy_localization.dart';
import 'package:core/src/theme/dimensions.dart';
import 'package:core/src/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomFieldWithTitle extends StatelessWidget {
  final Widget customTextField;
  final String? title;
  final bool requiredField;
  final bool isPadding;
  final bool isSKU;
  final bool limitSet;
  final String? setLimitTitle;
  final double? width;
  final Function()? onTap;
  const CustomFieldWithTitle({
    super.key,
    required this.customTextField,
    this.title,
    this.setLimitTitle,
    this.width,
    this.requiredField = false,
    this.isPadding = true,
    this.isSKU = false,
    this.limitSet = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: isPadding
            ? const EdgeInsets.all(Dimensions.paddingSizeDefault)
            : const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: title,
                    style: fontSizeRegular.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                    children: <TextSpan>[
                      requiredField
                          ? TextSpan(
                              text: '  *',
                              style: fontSizeBold.copyWith(color: Colors.red),
                            )
                          : const TextSpan(),
                    ],
                  ),
                ),
                isSKU
                    ? InkWell(
                        onTap: onTap,
                        child: Text(
                          limitSet ? setLimitTitle! : 'auto_generate'.tr(),
                          style: fontSizeRegular.copyWith(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            customTextField,
          ],
        ),
      ),
    );
  }
}
