import 'package:chef_app/core/extention/tanslate_extention.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_ask_login_or_register.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_text_form_field_password.dart';
import 'package:chef_app/features/auth/presentation/widgets/cuton_welcome_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        bool isLoading = false;
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomWelcomeAuth(text: context.messageWelcomeRegister),
                SizedBox(
                  height: 103.h,
                ),
                MainTextFormField(
                  horizontal: 26.w,
                  vertical: 14.h,
                  controller: controllerName,
                  text: context.name,
                  onChanged: (value) {},
                ),
                MainTextFormField(
                  horizontal: 26.w,
                  vertical: 14.h,
                  controller: controllerLocation,
                  text: context.location,
                  onChanged: (value) {},
                ),
                MainTextFormField(
                  horizontal: 26.w,
                  vertical: 14.h,
                  controller: controllerDisc,
                  text: context.disc,
                  onChanged: (value) {},
                ),
                MainTextFormField(
                  horizontal: 26.w,
                  vertical: 14.h,
                  controller: controllerBradName,
                  text: context.brandNamed,
                  onChanged: (value) {},
                ),
                // MainTextFormField(
                //   text: context.minCharge,
                //   onChanged: (value) {},
                // ),
                // MainTextFormField(
                //   text: context.healthCertificate,
                //   onChanged: (value) {},
                // ),
                // MainTextFormField(
                //   text: context.email,
                //   onChanged: (value) {},
                // ),
                CustomTextFormFieldPassword(
                  controller: controllerPassword,
                  text: context.password,
                  onChanged: (value) {},
                ),
                CustomTextFormFieldPassword(
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
                    isLoading: isLoading,
                    text: context.signUp,
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CustomAskLoginOrRegister(
                    textAsk: context.questionDontRegisterYet,
                    textNavigate: context.signIn,
                    ontap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteNamedScreens.logiscreen);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
