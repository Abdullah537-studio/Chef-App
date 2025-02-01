import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_text_form_field_password.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:chef_app/features/profile/domain/entities/request/change_password_request.dart';
import 'package:chef_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});
  TextEditingController controllerOldPassword = TextEditingController();
  TextEditingController controllerNewPassword = TextEditingController();
  TextEditingController controllerconfirmPassword = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  late ChangePasswordRequest changePasswordRequest;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.cubitStatus == CubitStatus.error) {
          showToast(ToastMessageStatus.error, state.message);
        } else if (state.cubitStatus == CubitStatus.loaded) {
          showToast(ToastMessageStatus.success, state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: formState,
          child: Scaffold(
            appBar: mainAppBar(context, context.changePassword),
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
                      text: context.changePassword,
                      textStyle: regularStyle(),
                    ),
                    CustomTextFormFieldPassword(
                      validate: (val) => Validate.generalValidate(context, val),
                      horizontal: 0,
                      vertical: 30.h,
                      text: context.oldPassword,
                      onChanged: (value) {},
                      controller: controllerOldPassword,
                    ),
                    CustomTextFormFieldPassword(
                      validate: (val) =>
                          Validate.passwordValidate(context, val),
                      horizontal: 0,
                      vertical: 30.h,
                      text: context.newPassword,
                      onChanged: (value) {},
                      controller: controllerNewPassword,
                    ),
                    CustomTextFormFieldPassword(
                      validate: (val) => Validate.confirmPasswordValidate(
                        context,
                        val,
                        context.newPassword,
                      ),
                      horizontal: 0,
                      vertical: 30.h,
                      text: context.confirmPassword,
                      onChanged: (value) {},
                      controller: controllerconfirmPassword,
                    ),
                    MainButton(
                      text: context.resetPassword,
                      onTap: () {
                        if (formState.currentState!.validate()) {
                          changePasswordRequest = ChangePasswordRequest(
                            oldPass: context.oldPassword,
                            newPass: context.newPassword,
                            confirmPassword: context.confirmPassword,
                          );
                          context.read<ProfileCubit>().changePassword(
                                changePasswordRequest: changePasswordRequest,
                              );
                        }
                      },
                      isLoading: state.cubitStatus == CubitStatus.loading,
                    ),
                    SizedBox(
                      height: 45.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
