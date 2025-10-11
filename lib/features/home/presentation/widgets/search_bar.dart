import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/core/constants/media_constants.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final Function(String)? onSearchChanged;
  final Function(String)? onChanged;
  final VoidCallback? onVoiceSearchPressed;
  final TextEditingController? controller;

  const CustomSearchBar({
    super.key,
    this.hintText = 'Search...',
    this.onSearchChanged,
    this.onChanged,
    this.onVoiceSearchPressed,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          // Search input field
          Expanded(
            child: Container(
              
              decoration: BoxDecoration(
                color: ColorManger.lightGrey,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TextField(
                controller: controller,
                onChanged: onChanged ?? onSearchChanged,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyles.b2.copyWith(
                    color: ColorManger.grey,
                  ),
                  //* Search icon
                  prefixIcon: Padding(
                    
                    padding: EdgeInsets.all(15.r),
                    child: SvgPicture.asset(
                      Media.search,
                      width: 20.w,
                      height: 20.h,
                      colorFilter: const ColorFilter.mode(
                        ColorManger.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),

          //* Voice search button
          GestureDetector(
            onTap: onVoiceSearchPressed,
            child: Container(
              padding: EdgeInsets.all(13.r),
              decoration: BoxDecoration(
                color: ColorManger.primary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                Media.voice,
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
