import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.isLoading});
  final String text;
  final bool isLoading;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 42.h,
      onPressed: onTap,
      color: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: isLoading
          ? SizedBox(
              height: 20.h,
              width: 20.w,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              ),
            )
          : MainTextWidget(
              text: text,
              textStyle: boldStyle(),
            ),
    );
  }
}
