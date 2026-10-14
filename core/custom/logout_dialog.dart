import 'package:easy_localization/easy_localization.dart';
import 'package:agreements/core/theme/dimensions.dart';
import 'package:agreements/core/theme/theme_manager.dart';
import 'package:agreements/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'app_button.dart';

class CustomDialog extends StatelessWidget {
  final bool isFailed;
  final double rotateAngle;
  final IconData icon;
  final bool delete;
  final String title;
  final String description;
  final Function()? onTapTrue;
  final String? onTapTrueText;
  final Function()? onTapFalse;
  final String? onTapFalseText;
  final bool? isInternetCheck;
  const CustomDialog({
    super.key,
    this.isFailed = false,
    this.rotateAngle = 0,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTapFalse,
    required this.onTapTrue,
    this.onTapTrueText,
    this.onTapFalseText,
    this.delete = false,
    this.isInternetCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: delete ? 0 : -55,
                child: Container(
                  height: delete ? 50 : 80,
                  width: delete ? 50 : 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: delete
                        ? ThemeManager.getRedColor()
                        : isFailed
                        ? ThemeManager.getRedColor()
                        : Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.rotate(
                    angle: rotateAngle,
                    child: delete
                        ? Icon(
                            icon,
                            size: 40,
                            color: delete
                                ? Theme.of(context).secondaryHeaderColor
                                : Colors.white,
                          )
                        : Icon(
                            icon,
                            size: 40,
                            color: delete
                                ? Theme.of(context).secondaryHeaderColor
                                : Colors.white,
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: fontSizeRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                      ),
                    ),
                    const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: fontSizeRegular,
                    ),
                    const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        children: [
                          if (isInternetCheck == null ||
                              isInternetCheck == false)
                            Expanded(
                              child: AppButton(
                                label: onTapFalseText ?? 'no'.tr(),
                                // Secondary action: outlined, so it never
                                // competes with the filled confirm button.
                                outlined: true,
                                height: 46,
                                onPressed: onTapFalse,
                              ),
                            ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AppButton(
                              label: onTapTrueText ?? 'yes'.tr(),
                              height: 46,
                              onPressed: onTapTrue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
