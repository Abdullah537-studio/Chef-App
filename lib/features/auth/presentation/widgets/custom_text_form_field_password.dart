import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldPassword extends StatelessWidget {
  const CustomTextFormFieldPassword({
    super.key,
    required this.text,
    required this.onChanged,
    required this.controller,
    required this.horizontal,
    required this.vertical,
    required this.validate,
  });
  final String text;
  final double horizontal;
  final double vertical;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? Function(String?)? validate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: TextFormField(
        validator: validate,
        controller: controller,
        onChanged: onChanged,
        obscureText: true,
        textInputAction: TextInputAction.next,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: 16.sp,
          ),
          suffixIcon: Icon(
            Icons.remove_red_eye,
            color: AppColors.iconStateTextFormFieldColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.redColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.greyColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
