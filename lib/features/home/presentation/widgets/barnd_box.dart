import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';

class BarndBox extends StatelessWidget {
  const BarndBox({
    super.key,
    required this.logoUrl,
    required this.brandName,
    this.onTap,
  });

  final String logoUrl;
  final String brandName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: ColorManger.lightGrey,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* Brand logo container
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.all(6.w),
            child: SvgPicture.network(
              logoUrl,
              fit: BoxFit.contain,
              
              placeholderBuilder: (context) => Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: ColorManger.grey,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),

          //* Brand name
          Text(
            brandName,
            style: TextStyles.b4.copyWith(
              color: ColorManger.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        ),
      ),
    );
  }
}
