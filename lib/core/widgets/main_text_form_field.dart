import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField(
      {super.key,
      required this.text,
      required this.onChanged,
      required this.controller,
      required this.vertical,
      required this.horizontal});
  final String text;
  final double vertical;
  final double horizontal;

  final TextEditingController controller;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: const Color(0xff9D9FA0),
            fontSize: 16.sp,
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
