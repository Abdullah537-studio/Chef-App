import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, "setting"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainTextWidget(text: "english", textStyle: regularStyle()),
              Switch(
                activeColor: AppColors.primaryColor,
                onChanged: (value) {
                  if (value) {
                    context.setLocale(const Locale("en"));
                  } else {
                    context.setLocale(const Locale("ar"));
                  }
                },
                value: context.locale == const Locale("ar") ? true : false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
