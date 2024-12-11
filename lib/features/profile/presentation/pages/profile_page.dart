import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/strings/image_png.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 74.h,
      ),
      child: Column(
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
          const MainTextWidget(
              text: "Ammar Ahmed", textStyleEnum: TextStyleEnum.titiel3Bold),
          const MainTextWidget(
              text: "ammar@gmail.com", textStyleEnum: TextStyleEnum.normal),
        ],
      ),
    ));
  }
}
