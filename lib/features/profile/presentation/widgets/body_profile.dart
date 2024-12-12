import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/profile/presentation/widgets/profile_operations.dart';
import 'package:chef_app/strings/color_strings.dart';
import 'package:chef_app/strings/image_png.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget showBodyProfile() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 56.5.r,
            child: Image.asset(ImageString.imageTest),
          ),
          InkWell(
            onTap: () {},
            child: Image.asset(ImageString.editeImageProfile),
          ),
        ],
      ),
      MainTextWidget(
          text: "Ammar Ahmed",
          textStyle: boldStyle(color: AppColors.blackColor)),
      Padding(
        padding: EdgeInsets.only(bottom: 20.h, top: 14.h),
        child: MainTextWidget(
          text: "ammar@gmail.com",
          textStyle: regularStyle(),
        ),
      ),
      const ProfileOperations()
    ],
  );
}
