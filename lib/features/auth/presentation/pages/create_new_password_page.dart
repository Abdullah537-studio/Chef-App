import 'package:chef_app/core/function/main_text_style.dart';
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
      appBar: mainAppBar(context, AppKeyTranslate.createNewPassword),
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
                text: AppKeyTranslate.createNewPassword,
                textStyle: regularStyle(),
              ),
              CustomTextFormFieldPassword(
                horizontal: 0,
                vertical: 30.h,
                text: AppKeyTranslate.password,
                onChanged: (value) {},
                controller: controllerPassword,
              ),
              CustomTextFormFieldPassword(
                horizontal: 0,
                vertical: 30.h,
                text: AppKeyTranslate.confirmPassword,
                onChanged: (value) {},
                controller: controllerConfirmPassword,
              ),
              MainTextFormField(
                horizontal: 0,
                vertical: 30.h,
                text: AppKeyTranslate.code,
                onChanged: (value) {},
                controller: controllerCode,
              ),
              MainButton(
                text: AppKeyTranslate.resetPassword,
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
