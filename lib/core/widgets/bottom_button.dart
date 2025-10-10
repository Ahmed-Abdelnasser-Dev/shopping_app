import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BottomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 75.h,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: const BoxDecoration(
            color: ColorManger.primary,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                text,
                style: TextStyles.b1.copyWith(color: ColorManger.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
