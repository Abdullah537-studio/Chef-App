import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconBootomNavBar extends StatelessWidget {
  const CustomIconBootomNavBar({
    super.key,
    required this.text,
    required this.image,
    required this.color,
    required this.ontap,
  });
  final String text;
  final String image;
  final Color color;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          SvgPicture.asset(
            image,
            // ignore: deprecated_member_use
            color: color,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: MainTextWidget(
              text: "Home",
              textStyle: boldStyle(fontSize: 12.sp, color: color),
            ),
          )
        ],
      ),
    );
  }
}
