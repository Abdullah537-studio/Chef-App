import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/profile/presentation/widgets/profile_operations.dart';
import 'package:chef_app/strings/color_strings.dart';
import 'package:chef_app/strings/image_png.dart';
import 'package:chef_app/strings/image_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _coustomBottomNavigationBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 74.h,
        ),
        child: Column(
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
        ),
      ),
    );
  }

  Container _coustomBottomNavigationBar() {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.whiteColor)),
      height: 85.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                SvgPicture.asset(ImageSvg.homeIconBottomNavBar),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: MainTextWidget(
                    text: "Home",
                    textStyle:
                        boldStyle(fontSize: 12.sp, color: AppColors.greyColor),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                SvgPicture.asset(ImageSvg.profileIconBottomNavBar),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: MainTextWidget(
                    text: "Profile",
                    textStyle:
                        boldStyle(fontSize: 12.sp, color: AppColors.greyColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
