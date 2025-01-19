import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xffFA9A0C);
  static const Color orangeColor = Color(0xffFB5607);
  static const Color textColor = Color(0xff1E1E1E);
  static const Color transparentColor = Colors.transparent;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greenColor = Colors.green;
  static const Color redColor = Color.fromARGB(255, 248, 49, 35);
  static const Color darkCharcoal = Color(0xff1E1E1E);
  static const Color greyColor = Color(0xff9D9FA0);
  static const Color errorValidateColor = Color(0xffBC4E47);
  static Color iconStateTextFormFieldColor = WidgetStateColor.resolveWith(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.error)) {
        return AppColors.redColor;
      } else if (states.contains(WidgetState.focused)) {
        return AppColors.primaryColor;
      }

      return AppColors.greyColor;
    },
  );
}
