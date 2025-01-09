import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showAlertDialog({
  required BuildContext context,
  required String title,
  required String body,
}) {
  // set up the buttons
  Widget cancelButton = MaterialButton(
    child: MainTextWidget(
      text: context.cancleDialog,
      textStyle: regularStyle(color: AppColors.redColor),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = MaterialButton(
    child: MainTextWidget(
      text: context.continueDialog,
      textStyle: regularStyle(color: AppColors.orangeColor),
    ),
    onPressed: () async {
      CacheHelper cache = CacheHelper();
      await cache.clearData();
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.logiscreen,
        (route) {
          return false;
        },
      );
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Align(
      alignment: Alignment.center,
      child: MainTextWidget(
        text: title,
        textStyle: regularStyle(fontSize: 24.sp),
      ),
    ),
    content: MainTextWidget(
      text: body,
      textStyle: regularStyle(),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
