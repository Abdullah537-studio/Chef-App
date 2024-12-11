import 'package:chef_app/strings/key_tanslate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension Trans on BuildContext {
  String get welcomeToApplication => tr(AppKeyTranslate.welcomeToApplication);
  String get chooseLanguage => tr(AppKeyTranslate.chooseLanguage);
  String get messageWelcomeLogin => tr(AppKeyTranslate.messageWelcomeLogin);
  String get messageWelcomeRegister =>
      tr(AppKeyTranslate.messageWelcomeRegister);
  String get email => tr(AppKeyTranslate.email);
  String get password => tr(AppKeyTranslate.password);
  String get confirmPassword => tr(AppKeyTranslate.confirmPassword);
  String get name => tr(AppKeyTranslate.name);
  String get location => tr(AppKeyTranslate.location);
  String get brandNamed => tr(AppKeyTranslate.brandNamed);
  String get minCharge => tr(AppKeyTranslate.minCharge);
  String get disc => tr(AppKeyTranslate.disc);
  String get healthCertificate => tr(AppKeyTranslate.healthCertificate);
  String get forgetPassword => tr(AppKeyTranslate.forgetPassword);
  String get signIn => tr(AppKeyTranslate.signIn);
  String get signUp => tr(AppKeyTranslate.signUp);
  String get questionDontRegisterYet =>
      tr(AppKeyTranslate.questionDontRegisterYet);
  String get questionHaveAccountBefore =>
      tr(AppKeyTranslate.questionHaveAccountBefore);
}
