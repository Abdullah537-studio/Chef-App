import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMealComponent extends StatelessWidget {
  const CustomMealComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: Image.asset(ImageString.imageTest),
          ),
          Column(
            children: [
              MainTextWidget(
                text: "Kitchen",
                textStyle: boldStyle(color: AppColors.blackColor),
              ),
              MainTextWidget(
                text: "some text",
                textStyle: regularStyle(),
              ),
              MainTextWidget(
                text: "some text",
                textStyle: regularStyle(),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: const SizedBox(
              width: 48,
              height: 48,
              child: Icon(
                Icons.cancel_outlined,
                color: AppColors.redColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
