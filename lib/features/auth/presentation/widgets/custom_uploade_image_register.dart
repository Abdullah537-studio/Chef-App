import 'dart:io';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/pick_file_function.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUploadeImageRegister extends StatefulWidget {
  CustomUploadeImageRegister({
    super.key,
    required this.text,
    required this.fileFunction,
    required this.vertical,
    required this.horizontal,
    required this.isValid,
  });
  final Function(File)? fileFunction;
  final String text;
  final double vertical;
  final double horizontal;
  bool isValid;
  @override
  State<CustomUploadeImageRegister> createState() =>
      _CustomUploadeImageRegisterState();
}

class _CustomUploadeImageRegisterState
    extends State<CustomUploadeImageRegister> {
  bool chooseNameOrEmpty = false;
  String? errorValidateMessage;
  String baseName = "";
  File? file;

  // دالة لإعادة تعيين الملف
  void deleteFile() {
    setState(() {
      chooseNameOrEmpty = false;
      baseName = "";
      file = null;
      widget.isValid = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            if (!chooseNameOrEmpty) {
              file = await pickFileFunction();
            }
          },
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: widget.horizontal,
              vertical: widget.vertical,
            ),
            width: double.infinity,
            height: 78.h,
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    !widget.isValid ? AppColors.redColor : AppColors.greyColor,
                width: 2.5.w,
              ),
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
        ),
        if (!widget.isValid)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 36.w,
            ),
            child: SizedBox(
              width: double.infinity,
              child: MainTextWidget(
                text: context.thisFieldRequiredValidate,
                textStyle: regularStyle(
                    color: AppColors.errorValidateColor, fontSize: 13.sp),
              ),
            ),
          ),
      ],
    );
  }
}
