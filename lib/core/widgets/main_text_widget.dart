import 'package:chef_app/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTextWidget extends StatelessWidget {
  const MainTextWidget({
    super.key,
    required this.text,
    required this.textStyleEnum,
  });
  final String text;
  final TextStyleEnum textStyleEnum;
  @override
  Widget build(BuildContext context) {
    switch (textStyleEnum) {
      case TextStyleEnum.title3:
        return Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36.sp,
            color: AppColors.darkCharcoal,
          ),
        );
      case TextStyleEnum.titiel3Bold:
        return Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.darkCharcoal,
          ),
        );
      case TextStyleEnum.title1:
        return Text(
          text,
          style: TextStyle(
            fontSize: 32.sp,
            color: AppColors.darkCharcoal,
          ),
        );

      case TextStyleEnum.title2:
        return Text(
          text,
          style: TextStyle(
            fontSize: 24.sp,
            color: AppColors.darkCharcoal,
          ),
        );

      case TextStyleEnum.appBar:
        return Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.whiteColor,
          ),
        );
      case TextStyleEnum.small:
        return Text(
          text,
          style: const TextStyle(),
        );

      case TextStyleEnum.button:
        return Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
            fontSize: 24.sp,
          ),
        );
      case TextStyleEnum.buttonTran:
        return Text(
          text,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        );
      case TextStyleEnum.welcomeAuth:
        return Text(
          text,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 32.sp,
          ),
        );
      case TextStyleEnum.medium:
        return Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: 16.sp,
          ),
        );
      case TextStyleEnum.textprimaryColor:
        return Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16.sp,
          ),
        );

      case TextStyleEnum.normal:
        return Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
          ),
        );
    }
  }
}

enum TextStyleEnum {
  title1,
  title2,
  title3,
  titiel3Bold,
  small,
  medium,
  button,
  buttonTran,
  appBar,
  welcomeAuth,
  textprimaryColor,
  normal,
}
