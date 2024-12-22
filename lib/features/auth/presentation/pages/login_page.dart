import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/login_requist_model.dart';
import 'package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_ask_login_or_register.dart';
import 'package:chef_app/features/auth/presentation/widgets/cuton_welcome_auth.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.cubitStatus == CubitStatus.loaded) {
          showToast(ToastMessageStatus.success, state.message);
          Navigator.pushReplacementNamed(context, RouteNamedScreens.homescreen);
        } else if (state.cubitStatus == CubitStatus.error) {
          showToast(ToastMessageStatus.error, state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomWelcomeAuth(
                    text: AppKeyTranslate.messageWelcomeLogin,
                  ),
                  SizedBox(height: 77.h),
                  MainTextFormField(
                    validate: Validate.emailValidate,
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: _controllerEmail,
                    text: AppKeyTranslate.email,
                    onChanged: (value) {},
                  ),
                  MainTextFormField(
                    validate: Validate.passwordValidate,
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: _controllerPassword,
                    text: AppKeyTranslate.password,
                    onChanged: (value) {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.h,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNamedScreens.sendCode,
                          );
                        },
                        child: MainTextWidget(
                          text: AppKeyTranslate.forgetPassword,
                          textStyle: boldStyle(
                              color: AppColors.greyColor, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 64.h,
                    ),
                    child: MainButton(
                      isLoading: state.cubitStatus == CubitStatus.loading,
                      text: AppKeyTranslate.signIn,
                      onTap: () {
                        if (_formState.currentState?.validate() ?? false) {
                          LoginRequiestModel loginRequiestModel =
                              LoginRequiestModel(
                            email: _controllerEmail.text,
                            password: _controllerPassword.text,
                          );
                          context
                              .read<AuthCubit>()
                              .login(loginRequiestModel: loginRequiestModel);
                          _controllerEmail.clear();
                          _controllerPassword.clear();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomAskLoginOrRegister(
                      textAsk: AppKeyTranslate.questionDontRegisterYet,
                      textNavigate: AppKeyTranslate.signUp,
                      ontap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNamedScreens.registerscreen,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
