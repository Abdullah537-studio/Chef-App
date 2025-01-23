import 'dart:io';

import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:flutter/material.dart';

class Validate {
  static String? generalValidate(BuildContext context, String? value) {
    if (value?.isEmpty ?? true) {
      return context.thisFieldRequiredValidate;
    }
    return null;
  }

  static String? phoneValidate(BuildContext context, String? value) {
    if (value?.isEmpty ?? true) {
      return context.thisFieldRequiredValidate;
    } else if (value?.contains(".") ?? true) {
      return context.thisFieldRequiredValidate;
    } else if (int.parse(value ?? "0") < 10) {
      return context.lengthPhoneValidation;
    }
    return null;
  }

  static String? minChargeValidate(BuildContext context, String? value) {
    if (value?.isEmpty ?? true) {
      return context.thisFieldRequiredValidate;
    } else if (value?.contains(".") ?? true) {
      return context.thisFieldRequiredValidate;
    }
    return null;
  }

  static String? discValidate(BuildContext context, String? value) {
    if (value?.isEmpty ?? true) {
      return context.thisFieldRequiredValidate;
    } else if (value!.length < 20) {
      return context.lengthDiscValidation;
    }
    return null;
  }

  static String? validateImage(BuildContext context, File? value) {
    if (value == null) {
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

  static String? passwordValidate(BuildContext context, String? value) {
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$');

    if (value?.isEmpty ?? true) {
      return context.thisFieldRequiredValidate;
    } else if (!passwordRegExp.hasMatch(value ?? "")) {
      return context.invalidPasswordValidate;
    } else if (value!.length < 6) {
      return context.invalidPasswordValidate;
    }
    return null;
  }

  static String? confirmPasswordValidate(
      BuildContext context, String? value, String? comperation) {
    if (value?.isEmpty ?? true) {
      return context.thisFieldRequiredValidate;
    } else if (comperation != value) {
      return context.confirmPasswordValidatoin;
    }
    return null;
  }
}
