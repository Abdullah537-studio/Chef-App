import 'dart:io';

import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/pick_file_function.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUploadeImageRegister extends StatefulWidget {
  const CustomUploadeImageRegister({
    super.key,
    required this.text,
    required this.fileFunction, // يجب أن يكون من نوع File؟
    required this.vertical,
    required this.horizontal,
  });
  final Function(File)? fileFunction;
  final String text;
  final double vertical;
  final double horizontal;

  @override
  State<CustomUploadeImageRegister> createState() =>
      _CustomUploadeImageRegisterState();
}

class _CustomUploadeImageRegisterState
    extends State<CustomUploadeImageRegister> {
  bool chooseNameOrEmpty = false;
  String baseName = "";
  File? file;
  void deleteFile() {
    setState(() {
      chooseNameOrEmpty = false;
      baseName = "";
      file = null; // إعادة تعيين الملف
    });
  }

  void selectImage() {
    pickImage((file) {
      widget.fileFunction!(file);
      setState(() {
        file = file; // تحديث الملف
        baseName = file.path.split('/').last; // تحديث اسم الملف
        chooseNameOrEmpty = true; // تحديث الحالة
        widget.fileFunction;
      });
    }, (baseName) {
      setState(() {
        this.baseName = baseName; // تحديث اسم الملف
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!chooseNameOrEmpty) {
          selectImage(); // اختيار صورة جديدة
        }
      },
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        margin: EdgeInsets.symmetric(
          horizontal: widget.horizontal,
          vertical: widget.vertical,
        ),
        width: double.infinity,
        height: 78.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor, width: 1.5.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: chooseNameOrEmpty
            ? Card(
                child: Padding(
                  padding: const EdgeInsets.all(11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainTextWidget(
                        text: baseName,
                        textStyle: boldStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      InkWell(
                        onTap: deleteFile,
                        child: const Icon(
                          Icons.cancel,
                          size: 23,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : MainTextWidget(
                text: widget.text,
                textStyle: boldStyle(
                  color: AppColors.greyColor,
                  fontSize: 16.sp,
                ),
              ),
      ),
    );
  }
}
