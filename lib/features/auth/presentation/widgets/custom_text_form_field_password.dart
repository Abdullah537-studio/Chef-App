import 'package:chef_app/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldPassword extends StatelessWidget {
  const CustomTextFormFieldPassword({
    super.key,
    required this.text,
    required this.onChanged,
    required this.controller,
  });
  final String text;
  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: true,
        textInputAction: TextInputAction.next,
        cursorColor: AppColors.mainColor,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: AppColors.borderTextFormField,
            fontSize: 16.sp,
          ),
          suffixIcon: Icon(
            Icons.remove_red_eye,
            color: AppColors.borderTextFormField,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.redColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.borderTextFormField,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
