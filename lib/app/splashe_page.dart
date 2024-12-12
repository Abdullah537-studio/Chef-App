import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/strings/color_strings.dart';
import 'package:chef_app/strings/constant_string.dart';
import 'package:chef_app/strings/image_png.dart';
import 'package:chef_app/strings/key_cache_value.dart';
import 'package:flutter/material.dart';

class SplasheScreen extends StatefulWidget {
  const SplasheScreen({super.key});

  @override
  State<SplasheScreen> createState() => _SplasheScreenState();
}

class _SplasheScreenState extends State<SplasheScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        String? token;
        await CacheHelper().getData(key: AppKeyCache.token).then(
              (value) => token = value,
            );
        if (token != null) {
          Navigator.pushReplacementNamed(context, RouteNamedScreens.homeScren);
        } else {
          Navigator.pushReplacementNamed(context, RouteNamedScreens.chooseLang);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageString.chefImage),
          SizedBox(
            width: double.infinity,
            child: MainTextWidget(
              text: AppConstantString.cheffApp,
              textStyle: boldStyle(color: AppColors.darkCharcoal),
            ),
          )
        ],
      ),
    );
  }
}
