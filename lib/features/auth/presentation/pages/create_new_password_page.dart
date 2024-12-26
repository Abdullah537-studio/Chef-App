import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_text_form_field_password.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeForgettonPassword extends StatelessWidget {
  ChangeForgettonPassword({super.key});
  final TextEditingController controllerCode = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, context.createNewPassword),
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
                text: context.createNewPassword,
                textStyle: regularStyle(),
              ),
              CustomTextFormFieldPassword(
                validate: (val) => Validate.passwordValidate(context, val),
                horizontal: 0,
                vertical: 30.h,
                text: context.password,
                onChanged: (value) {},
                controller: controllerPassword,
              ),
              CustomTextFormFieldPassword(
                validate: (val) => Validate.passwordValidate(context, val),
                horizontal: 0,
                vertical: 30.h,
                text: context.confirmPassword,
                onChanged: (value) {},
                controller: controllerConfirmPassword,
              ),
              MainTextFormField(
                validate: (val) => Validate.passwordValidate(context, val),
                horizontal: 0,
                vertical: 30.h,
                text: context.code,
                onChanged: (value) {},
                controller: controllerCode,
              ),
              MainButton(
                text: context.resetPassword,
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
