import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData? mainThemeData() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: AppColors.iconStateTextFormFieldColor,
      hoverColor: Colors.black,
      focusColor: Colors.black,
      fillColor: Colors.black,
      hintStyle: boldStyle(
        color: AppColors.greyColor,
        fontSize: 16.sp,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2.5,
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.redColor,
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.redColor,
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.greyColor,
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Colors.yellow,
      selectionHandleColor: AppColors.primaryColor,
      cursorColor: AppColors.primaryColor,
    ),
    hintColor: Colors.blue,
  );
}
