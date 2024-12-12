import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/strings/color_strings.dart';
import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context, String text) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back,
        color: AppColors.whiteColor,
      ),
    ),
    title: MainTextWidget(
      text: text,
      textStyle: boldStyle(),
    ),
  );
}
