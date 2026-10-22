import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QueueListSkeleton extends StatelessWidget {
  const QueueListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 5,
      separatorBuilder: (_, _) =>
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
      itemBuilder: (context, index) => Container(
        height: 72.h,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeDefault.w,
          vertical: Dimensions.PADDING_SIZE_SMALL.h,
        ),
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT.r),
          border: Border.all(color: context.clinicBorder, width: 1.w),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: Dimensions.RADIUS_DEFAULT.r * 1.8,
              backgroundColor: AppColors.shimmerBase,
            ),
            SizedBox(width: Dimensions.paddingSizeDefault.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: AppColors.shimmerBase,
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
                    ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_BORDER.h * 2),
                  Container(
                    width: 200.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: AppColors.shimmerHighlight,
                      borderRadius:
                          BorderRadius.circular(Dimensions.RADIUS_SMALL.r),
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
