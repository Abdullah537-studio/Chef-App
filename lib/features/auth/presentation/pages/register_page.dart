import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/custom_location_search_widget.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_ask_login_or_register.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_text_form_field_password.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_upload_image_field.dart';
import 'package:chef_app/features/auth/presentation/widgets/cuton_welcome_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final GlobalKey<FormState> formState = GlobalKey();

  String? healthCertificate, profilePic, frontId, backId;
  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.cubitStatus == CubitStatus.error) {
          showToast(
            ToastMessageStatus.error,
            state.message,
          );
        } else if (state.cubitStatus == CubitStatus.loaded) {
          authCubit.clearControllersRegisters();
          showToast(ToastMessageStatus.success, state.message);
          Navigator.pushNamed(context, RouteNamedScreens.logiscreen);
        }
      },
      builder: (context, state) {
        return Form(
          key: formState,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomWelcomeAuth(text: context.messageWelcomeRegister),
                  SizedBox(
                    height: 103.h,
                  ),
                  //!======== Name
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authCubit.controllerName,
                    text: context.name,
                  ),
                  //!======== Phone
                  MainTextFormField(
                    textinputType:
                        const TextInputType.numberWithOptions(decimal: false),
                    validate: (val) => Validate.phoneValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authCubit.controllerPhone,
                    text: context.phone,
                  ),
                  //!======== location
                  LocationSearchWidget(
                    text: context.location,
                    validate: (value) =>
                        Validate.generalValidate(context, value),
                    controller: authCubit.controllerLocation,
                    onLocationSelected: (location) {
                      context.read<AuthCubit>().locatoinModel = location;
                    },
                  ),

                  //!======== min charge
                  MainTextFormField(
                    textinputType: TextInputType.number,
                    validate: (val) => Validate.minChargeValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authCubit.controllerMinCharge,
                    text: context.minCharge,
                  ),
                  //!======== discription
                  MainTextFormField(
                    validate: (val) => Validate.discValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authCubit.controllerDisc,
                    text: context.disc,
                  ),
                  //!======== Brand Name
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authCubit.controllerBradName,
                    text: context.brandNamed,
                  ),

                  //!======== healthCertificate شهادة صحية
                  CustomUploadImageField(
                    text: context.healthCertificate,
                    onFilePicked: (value) {
                      healthCertificate = value?.path;
                    },
                  ),

                  //!======== frontId الهوية الأمامية
                  CustomUploadImageField(
                    text: context.frontId,
                    onFilePicked: (value) {
                      frontId = value?.path;
                    },
                  ),

                  //!======== backId الهوية الخلفية
                  CustomUploadImageField(
                    text: context.backId,
                    onFilePicked: (value) {
                      backId = value?.path;
                    },
                  ),

                  //!======== profilePic صورة الملف الشخصي
                  CustomUploadImageField(
                    text: context.profilePicture,
                    onFilePicked: (value) {
                      profilePic = value?.path;
                    },
                  ),

                  //!======== Email
                  MainTextFormField(
                    validate: (val) => Validate.emailValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authCubit.controllerEmail,
                    text: context.email,
                  ),
                  //!======== Password
                  CustomTextFormFieldPassword(
                    validate: (val) => Validate.passwordValidate(context, val),
                    horizontal: 24.w,
                    vertical: 12.h,
                    controller: authCubit.controllerPassword,
                    text: context.password,
                  ),
                  //!======== Confirm Password
                  CustomTextFormFieldPassword(
                    validate: (val) => Validate.confirmPasswordValidate(
                      context,
                      val,
                      authCubit.controllerPassword.text,
                    ),
                    horizontal: 24.w,
                    vertical: 12.h,
                    controller: authCubit.controllerConfirmPassword,
                    text: context.confirmPassword,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 64.h,
                    ),
//!============== register Button
                    child: MainButton(
                      isLoading: state.cubitStatus == CubitStatus.loading,
                      text: context.signUp,
                      onTap: () async {
                        if (formState.currentState!.validate() &&
                            healthCertificate != null &&
                            frontId != null &&
                            backId != null &&
                            profilePic != null) {
                          context.read<AuthCubit>().register(
                                registerRequestModel:
                                    authCubit.registerModelRequest(
                                  backId: backId,
                                  frontId: frontId,
                                  healthCertificate: healthCertificate,
                                  profilePic: profilePic,
                                ),
                              );
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomAskLoginOrRegister(
                      textAsk: context.questionDontRegisterYet,
                      textNavigate: context.signIn,
                      ontap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNamedScreens.logiscreen,
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
