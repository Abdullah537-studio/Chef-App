import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/widgets/main_button_chooce_lang.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/constant_string.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseLangPage extends StatelessWidget {
  const ChooseLangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 2,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImageString.backgroundChangeLangPage))),
      child: Scaffold(
        backgroundColor: AppColors.transparentColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageString.chefImage),
            Text(
              AppKeyTranslate.welcomeToApplication,
              style: TextStyle(fontSize: 32.sp, color: AppColors.textColor),
            ),
            Padding(
              padding: EdgeInsets.only(top: 54.h, bottom: 102.h),
              child: Text(
                AppKeyTranslate.chooseLanguage,
                style: TextStyle(fontSize: 24.sp, color: AppColors.textColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MainButtonChooceLang(
                    onTap: () {
                      context.setLocale(const Locale(AppConstantString.ar));
                      Navigator.pushNamed(
                          context, RouteNamedScreens.logiscreen);
                    },
                    text: AppConstantString.arabic),
                MainButtonChooceLang(
                    onTap: () {
                      context.setLocale(const Locale(AppConstantString.en));
                      Navigator.pushNamed(
                          context, RouteNamedScreens.logiscreen);
                    },
                    text: AppConstantString.english),
              ],
            )
          ],
        ),
      ),
    );
  }
}
