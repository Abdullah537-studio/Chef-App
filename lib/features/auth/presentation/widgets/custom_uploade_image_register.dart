import 'dart:io';

import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/pick_file_function.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUploadeImageRegister extends StatelessWidget {
  const CustomUploadeImageRegister({
    super.key,
    required this.text,
    required this.file,
    required this.vertical,
    required this.horizontal,
  });
  final String text;
  final Function(File) file;
  final double vertical;
  final double horizontal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        uploadFile(file);
      },
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        width: double.infinity,
        height: 78.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor, width: 1.5.w),
            borderRadius: BorderRadius.circular(12.r)),
        child: MainTextWidget(
          text: text,
          textStyle: boldStyle(
            color: AppColors.greyColor,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
