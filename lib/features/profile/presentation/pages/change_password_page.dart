import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_text_form_field_password.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});
  TextEditingController controllerOldPassword = TextEditingController();
  TextEditingController controllerNewPassword = TextEditingController();
  TextEditingController controllerconfirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, "Change Password"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: 40.h,
                    bottom: 26.h,
                  ),
                  child: Image.asset(ImageString.lockImage)),
              MainTextWidget(
                text: "Change Password",
                textStyle: regularStyle(),
              ),
              CustomTextFormFieldPassword(
                validate: (val) => Validate.passwordValidate(context, val),
                horizontal: 0,
                vertical: 30.h,
                text: "old password",
                onChanged: (value) {},
                controller: controllerOldPassword,
              ),
              CustomTextFormFieldPassword(
                validate: (val) => Validate.passwordValidate(context, val),
                horizontal: 0,
                vertical: 30.h,
                text: "new Password",
                onChanged: (value) {},
                controller: controllerNewPassword,
              ),
              CustomTextFormFieldPassword(
                validate: (val) => Validate.passwordValidate(context, val),
                horizontal: 0,
                vertical: 30.h,
                text: context.confirmPassword,
                onChanged: (value) {},
                controller: controllerconfirmPassword,
              ),
              MainButton(
                text: "Reset Password",
                onTap: () {},
                isLoading: false,
              ),
              SizedBox(
                height: 45.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
