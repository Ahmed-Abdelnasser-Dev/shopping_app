// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/core/theme/colors.dart';
import 'package:shopping_app/core/theme/text_styles.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? hint;
  final IconData? suffixIcon;
  final Color? suffixColor;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String?) validator;

  const LabeledTextField({
    super.key,
    required this.label,
    this.controller,
    this.hint,
    this.suffixIcon,
    this.suffixColor,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(label, style: TextStyles.b3.copyWith(color: ColorManger.grey)),

        SizedBox(height: 10.h),

        // TextField
        TextFormField(
          cursorColor: ColorManger.primary,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyles.b2.copyWith(color: ColorManger.black),

          decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            hintStyle: TextStyles.b2.copyWith(color: ColorManger.grey),

            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManger.grey, width: 0.5),
            ),

            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManger.primary, width: 0.8),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManger.successGreen, width: 0.8),
            ),
            
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: suffixColor, size: 18.sp)
                : null,
          ),
          validator: (value) {
            return validator(value);
          },
        ),
      ],
    );
  }
}
