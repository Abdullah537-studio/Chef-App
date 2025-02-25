import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildScreenOnBoardingScreen({
  required String title,
  required String description,
  required String image,
  required BuildContext context,
}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height - 80,
    child: Column(
      spacing: 15.h,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageString.chefImage),
        MainTextWidget(
          text: title,
          textStyle: boldStyle(
            color: Colors.black,
          ),
        ),
        MainTextWidget(
          text: description,
          textStyle: regularStyle(),
        ),
      ],
    ),
  );
}
