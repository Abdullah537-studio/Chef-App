import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/strings/image_png.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWelcomeAuth extends StatelessWidget {
  const CustomWelcomeAuth({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 222.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(ImageString.backgroundWelcomeAuth),
        ),
      ),
      child: Center(
        child: MainTextWidget(
          text: text,
          textStyle: boldStyle(),
        ),
      ),
    );
  }
}
