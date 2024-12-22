import 'package:chef_app/core/strings/key_tanslate.dart';

class Validate {
  static String? generalValidate(String? value) {
    if (value?.isEmpty ?? true) {
      return AppKeyTranslate.thisFieldRequiredValidate;
    }
    return null;
  }

  static String? emailValidate(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (value?.isEmpty ?? true) {
      return AppKeyTranslate.thisFieldRequiredValidate;
    } else if (!emailRegExp.hasMatch(value ?? "")) {
      return AppKeyTranslate.invalidEmailValidate;
    }
    return null;
  }

  static String password = "";

  static String? passwordValidate(String? value) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
    );

    if (value?.isEmpty ?? true) {
      return AppKeyTranslate.thisFieldRequiredValidate;
    } else if (!passwordRegExp.hasMatch(value ?? "")) {
      return "";
    }
    return null;
  }
}
