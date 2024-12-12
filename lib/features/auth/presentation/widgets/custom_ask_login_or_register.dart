import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAskLoginOrRegister extends StatelessWidget {
  const CustomAskLoginOrRegister(
      {super.key,
      required this.textAsk,
      required this.textNavigate,
      this.ontap});
  final String textAsk;
  final String textNavigate;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MainTextWidget(
          text: textAsk,
          textStyle: boldStyle(color: AppColors.greyColor, fontSize: 16.sp),
        ),
        TextButton(
          onPressed: ontap,
          child: MainTextWidget(
            text: textNavigate,
            textStyle:
                boldStyle(color: AppColors.primaryColor, fontSize: 16.sp),
          ),
        )
      ],
    );
  }
}
