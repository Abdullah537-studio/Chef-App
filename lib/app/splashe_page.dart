import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/strings/color_strings.dart';
import 'package:chef_app/strings/constant_string.dart';
import 'package:chef_app/strings/image_png.dart';
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
        Navigator.pushReplacementNamed(context, RouteNamedScreens.homescreen);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageString.chefImage),
          const SizedBox(
            width: double.infinity,
            child: MainTextWidget(
              text: AppConstantString.cheffApp,
              textStyleEnum: TextStyleEnum.title3,
            ),
          )
        ],
      ),
    );
  }
}
