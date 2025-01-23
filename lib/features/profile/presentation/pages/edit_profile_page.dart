import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/custom_image_edit.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_text_form_field_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key, this.image});
  final String? image;
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
      appBar: mainAppBar(context, context.editProfile),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: CustomImageWithEdit(
                image: image,
                ontap: () {},
              ),
            ),
            MainTextFormField(
              validate: (val) => Validate.generalValidate(context, val),
              horizontal: 26.w,
              vertical: 14.h,
              controller: controllerName,
              text: context.name,
              onChanged: (value) {},
            ),
            MainTextFormField(
              validate: (val) => Validate.generalValidate(context, val),
              horizontal: 26.w,
              vertical: 14.h,
              controller: controllerLocation,
              text: context.location,
              onChanged: (value) {},
            ),
            MainTextFormField(
              validate: (val) => Validate.generalValidate(context, val),
              horizontal: 26.w,
              vertical: 14.h,
              controller: controllerDisc,
              text: context.disc,
              onChanged: (value) {},
            ),
            MainTextFormField(
              validate: (val) => Validate.generalValidate(context, val),
              horizontal: 26.w,
              vertical: 14.h,
              controller: controllerBradName,
              text: context.brandNamed,
              onChanged: (value) {},
            ),
            CustomTextFormFieldPassword(
              validate: (val) => Validate.passwordValidate(context, val),
              horizontal: 24,
              vertical: 12,
              controller: controllerPassword,
              text: context.password,
              onChanged: (value) {},
            ),
            CustomTextFormFieldPassword(
              validate: (val) => Validate.passwordValidate(context, val),
              horizontal: 24,
              vertical: 12,
              controller: controllerConfirmPassword,
              text: context.confirmPassword,
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
