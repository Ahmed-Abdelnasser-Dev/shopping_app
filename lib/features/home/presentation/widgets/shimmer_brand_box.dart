import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/colors.dart';

class ShimmerBrandBox extends StatelessWidget {
  const ShimmerBrandBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      color: ColorManger.lightGrey,
      child: Container(
        width: 58.w,
        height: 58.h,
        margin: EdgeInsets.only(right: 14.w),
        decoration: BoxDecoration(
          color: ColorManger.lightGrey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
