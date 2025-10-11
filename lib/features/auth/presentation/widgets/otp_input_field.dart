import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isFirst;
  final bool isLast;
  final ValueChanged<String> onChanged;

  const OtpInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isFirst,
    required this.isLast,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 45.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: focusNode.hasFocus
              ? ColorManger.primary
              : ColorManger.lightGrey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8.r),
        color: ColorManger.white,
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        style: TextStyles.h3.copyWith(
          color: ColorManger.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
