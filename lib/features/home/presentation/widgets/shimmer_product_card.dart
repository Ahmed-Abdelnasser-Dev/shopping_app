import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/spacing.dart';

class ShimmerProductCard extends StatelessWidget {
  const ShimmerProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      color: ColorManger.lightGrey,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(Spacing.generalSpacing),
        decoration: BoxDecoration(
          color: ColorManger.lightGrey,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManger.lightGrey,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 12.h,
              width: 70.w,
              color: ColorManger.lightGrey,
            ),
            SizedBox(height: 7.h),
            Container(
              height: 12.h,
              width: 40.w,
              color: ColorManger.lightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
