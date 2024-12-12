import 'package:chef_app/core/extention/tanslate_extention.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/strings/image_png.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, "Forget Password"),
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
                text: "Enter Your mail and we will send code to",
                textStyle: regularStyle(),
              ),
              MainTextWidget(
                text: " reset your password",
                textStyle: regularStyle(),
              ),
              MainTextFormField(
                horizontal: 0,
                vertical: 30.h,
                text: context.email,
                onChanged: (value) {},
                controller: controller,
              ),
              MainButton(
                text: "Send Code",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.createNewPassword,
                  );
                },
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
