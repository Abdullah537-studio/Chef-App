import 'package:chef_app/core/strings/color_strings.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(
  ToastMessageStatus toastMessageStatus,
  String? text,
) {
  Fluttertoast.showToast(
    msg: text ?? "empty value",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: toastMessageStatus == ToastMessageStatus.success
        ? AppColors.primaryColor
        : toastMessageStatus == ToastMessageStatus.error
            ? AppColors.redColor
            : AppColors.greenColor,
    textColor: AppColors.whiteColor,
    fontSize: 16.0,
  );
}

enum ToastMessageStatus { success, error, warning }
