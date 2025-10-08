import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static const String fontFamily = 'Inter';

  // ------------------ Headline ------------------ //
  static TextStyle get h1 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 34.sp,
        height: 1.10,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get h2 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 28.sp,
        height: 1.10,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get h3 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 22.sp,
        height: 1.10,
        fontWeight: FontWeight.w500,
      );

  // ------------------ Paragraph ------------------ //
  static TextStyle get p1 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 34.sp,
        height: 1.40,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get p2 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 28.sp,
        height: 1.40,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get p3 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 22.sp,
        height: 1.40,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get p4 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 17.sp,
        height: 1.40,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get p5 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 15.sp,
        height: 1.40,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get p6 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 13.sp,
        height: 1.40,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get p7 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 11.sp,
        height: 1.40,
        fontWeight: FontWeight.w500,
      );

  // ------------------ Body ------------------ //
  static TextStyle get b1 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 17.sp,
        height: 1.10,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get b2 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 15.sp,
        height: 1.10,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get b3 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 13.sp,
        height: 1.10,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get b4 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 11.sp,
        height: 1.10,
        fontWeight: FontWeight.w500,
      );

  // ------------------ Regular Variants ------------------ //
  static TextStyle get b1Regular => b1.copyWith(fontWeight: FontWeight.w400);
  static TextStyle get b2Regular => b2.copyWith(fontWeight: FontWeight.w400);
  static TextStyle get b3Regular => b3.copyWith(fontWeight: FontWeight.w400);
  static TextStyle get b4Regular => b4.copyWith(fontWeight: FontWeight.w400);
}
