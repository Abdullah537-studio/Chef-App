import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:flutter/material.dart';

class Validate {
  static String? generalValidate(BuildContext context, String? value) {
    if (value?.isEmpty ?? true) {
      return context.thisFieldRequiredValidate;
    }
    return null;
  }

  static String? emailValidate(BuildContext context, String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (value?.isEmpty ?? true) {
      return context.thisFieldRequiredValidate;
    } else if (!emailRegExp.hasMatch(value ?? "")) {
      return context.invalidEmailValidate;
    }
    return null;
  }

  static String password = "";

  static String? passwordValidate(BuildContext context, String? value) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
    );

    if (value?.isEmpty ?? true) {
      return context.thisFieldRequiredValidate;
    } else if (!passwordRegExp.hasMatch(value ?? "")) {
      return "";
    }
    return null;
  }
}
