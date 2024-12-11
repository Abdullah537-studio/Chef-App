import 'package:chef_app/core/extention/tanslate_extention.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/strings/image_png.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordPage extends StatelessWidget {
  CreateNewPasswordPage({super.key});
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, "Create New Password"),
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
              const MainTextWidget(
                text: "create new password",
                textStyleEnum: TextStyleEnum.normal,
              ),
              MainTextFormField(
                horizontal: 0,
                vertical: 30.h,
                text: context.email,
                onChanged: (value) {},
                controller: controllerEmail,
              ),
              MainTextFormField(
                horizontal: 0,
                vertical: 30.h,
                text: context.password,
                onChanged: (value) {},
                controller: controllerPassword,
              ),
              MainTextFormField(
                horizontal: 0,
                vertical: 30.h,
                text: context.confirmPassword,
                onChanged: (value) {},
                controller: controllerConfirmPassword,
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