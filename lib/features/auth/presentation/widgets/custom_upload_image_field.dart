import 'dart:io';

import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/pick_file_function.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUploadImageField extends StatelessWidget {
  const CustomUploadImageField({
    super.key,
    required this.text,
    required this.onFilePicked,
  });
  final ValueChanged<File?> onFilePicked;
  final String text;

  @override
  Widget build(BuildContext context) {
    File? file;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 26.w, vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: double.infinity,
      height: 65.h,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.greyColor),
      ),
      child: StatefulBuilder(
        builder: (BuildContext context, setState) {
          if (file == null) {
            onFilePicked(null);

            return GestureDetector(
              onTap: () async {
                file = await pickFileFunction();
                onFilePicked(file);
                setState(() {});
              },
              child: SizedBox(
                width: double.infinity,
                child: MainTextWidget(
                    text: text,
                    textStyle: boldStyle(
                      fontSize: 16.sp,
                      color: AppColors.greyColor,
                    )),
              ),
            );
          } else {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainTextWidget(
                      text: file!.path.split('/').last,
                      textStyle: boldStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    InkWell(
                      onTap: () {
                        file?.delete();
                        file = null;
                        onFilePicked(null);
                        setState(() {});
                      },
                      child: const Icon(
                        color: Colors.orange,
                        Icons.cancel,
                        size: 23,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
