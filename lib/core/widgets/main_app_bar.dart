import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/strings/color_strings.dart';
import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context, String text) {
  return AppBar(
    backgroundColor: AppColors.mainColor,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: AppColors.whiteColor,
      ),
    ),
    title: MainTextWidget(
      text: text,
      textStyleEnum: TextStyleEnum.appBar,
    ),
  );
}
