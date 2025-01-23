import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBoxRequestMeal extends StatelessWidget {
  const CustomCheckBoxRequestMeal({
    super.key,
    required this.text,
    required this.isCheacked,
    required this.ontap,
  });
  final String text;
  final bool isCheacked;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyColor, width: 2.w),
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
            ),
            child: isCheacked
                ? Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  )
                : const SizedBox(),
          ),
          SizedBox(width: 6.w),
          MainTextWidget(text: text, textStyle: regularStyle()),
        ],
      ),
    );
  }
}
