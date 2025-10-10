import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumbers;
  final bool hasSpecialCharacters;
  final bool isLongEnough;

  const PasswordValidations({
    super.key,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasNumbers,
    required this.hasSpecialCharacters,
    required this.isLongEnough,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        validationItem("At least 8 characters", isLongEnough),
        SizedBox(height: 4.h),
        validationItem("At least one uppercase letter", hasUppercase),
        SizedBox(height: 4.h),
        validationItem("At least one lowercase letter", hasLowercase),
        SizedBox(height: 4.h),
        validationItem("At least one number", hasNumbers),
        SizedBox(height: 4.h),
        validationItem("At least one special character", hasSpecialCharacters),
        SizedBox(height: 4.h),
      ],
    );
  }
}

Widget validationItem(String text, bool isValid) {
  return Row(
    children: [
      Icon(
        Icons.check,
        color: isValid ? ColorManger.successGreen : ColorManger.errorRed,
        size: 10.sp,
      ),
      SizedBox(width: 5.w),
      Text(
        text,
        style: TextStyles.b4Regular.copyWith(
          color: ColorManger.grey,
          decoration: isValid
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
    ],
  );
}
