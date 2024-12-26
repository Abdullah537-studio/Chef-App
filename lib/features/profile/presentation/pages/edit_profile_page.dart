import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_text_form_field_password.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerLocation = TextEditingController();
  final TextEditingController controllerDisc = TextEditingController();
  final TextEditingController controllerBradName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, AppKeyTranslate.editProfile),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 74.r,
                    child: Image.asset(ImageString.imageTest),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(ImageString.editeImageProfile),
                  ),
                ],
              ),
            ),
            MainTextFormField(
              validate: Validate.generalValidate,
              horizontal: 26.w,
              vertical: 14.h,
              controller: controllerName,
              text: AppKeyTranslate.name,
              onChanged: (value) {},
            ),
            MainTextFormField(
              validate: Validate.generalValidate,
              horizontal: 26.w,
              vertical: 14.h,
              controller: controllerLocation,
              text: AppKeyTranslate.location,
              onChanged: (value) {},
            ),
            MainTextFormField(
              validate: Validate.generalValidate,
              horizontal: 26.w,
              vertical: 14.h,
              controller: controllerDisc,
              text: AppKeyTranslate.disc,
              onChanged: (value) {},
            ),
            MainTextFormField(
              validate: Validate.generalValidate,
              horizontal: 26.w,
              vertical: 14.h,
              controller: controllerBradName,
              text: AppKeyTranslate.brandNamed,
              onChanged: (value) {},
            ),
            CustomTextFormFieldPassword(
              validate: Validate.passwordValidate,
              horizontal: 24,
              vertical: 12,
              controller: controllerPassword,
              text: AppKeyTranslate.password,
              onChanged: (value) {},
            ),
            CustomTextFormFieldPassword(
              validate: Validate.passwordValidate,
              horizontal: 24,
              vertical: 12,
              controller: controllerConfirmPassword,
              text: AppKeyTranslate.confirmPassword,
              onChanged: (value) {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 64.h,
              ),
              child: MainButton(
                isLoading: false,
                text: "Update",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
