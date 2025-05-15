import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/constant_string.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Locale currentLocale = context.locale;

    return Scaffold(
      appBar: mainAppBar(context, context.settings),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainTextWidget(
                  text: context.chooseLanguage,
                  textStyle: regularStyle(),
                ),
                DropdownButton<Locale>(
                  underline: const SizedBox.shrink(),
                  value: currentLocale,
                  onChanged: (Locale? newLocale) async {
                    if (newLocale != null) {
                      await context.setLocale(newLocale);
                    }
                  },
                  items: <Locale>[
                    Locale(AppConstantString.ar),
                    Locale(AppConstantString.en)
                  ].map((Locale locale) {
                    return DropdownMenuItem<Locale>(
                      value: locale,
                      child: MainTextWidget(
                        text: locale.languageCode == AppConstantString.ar
                            ? AppConstantString.arabic
                            : AppConstantString.english,
                        textStyle: regularStyle(),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
