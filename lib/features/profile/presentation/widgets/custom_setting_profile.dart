import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSettingProfile extends StatelessWidget {
  const CustomSettingProfile({
    super.key,
    required this.text,
    required this.image,
    required this.ontap,
    required this.colorTextIsPrimary,
  });
  final String text;
  final String image;
  final bool colorTextIsPrimary;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      child: InkWell(
        onTap: ontap,
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 33.h,
              width: 33.w,
            ),
            SizedBox(width: 16.w),
            MainTextWidget(
              text: text,
              textStyle: boldStyle(
                color: colorTextIsPrimary
                    ? AppColors.orangeColor
                    : AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
