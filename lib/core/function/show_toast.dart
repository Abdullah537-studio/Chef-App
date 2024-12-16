import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(ToastMessageStatus toastMessageStatus) {
  Fluttertoast.showToast(
    msg: toastMessageStatus == ToastMessageStatus.success
        ? AppKeyTranslate.success
        : toastMessageStatus == ToastMessageStatus.error
            ? AppKeyTranslate.error
            : AppKeyTranslate.warning,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: toastMessageStatus == ToastMessageStatus.success
        ? AppColors.primaryColor
        : toastMessageStatus == ToastMessageStatus.error
            ? AppColors.redColor
            : AppColors.orangeColor,
    textColor: AppColors.whiteColor,
    fontSize: 16.0,
  );
}

enum ToastMessageStatus { success, error, warning }
