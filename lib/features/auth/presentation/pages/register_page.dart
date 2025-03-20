import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/register_requist_model.dart';
import 'package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_ask_login_or_register.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_text_form_field_password.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_uploade_image_register.dart';
import 'package:chef_app/features/auth/presentation/widgets/cuton_welcome_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // final TextEditingController controllerName = TextEditingController();
  // final TextEditingController controllerEmail = TextEditingController();
  // final TextEditingController controllerPassword = TextEditingController();
  // final TextEditingController controllerConfirmPassword =
  //     TextEditingController();
  // final TextEditingController controllerPhone = TextEditingController();
  // final TextEditingController controllerLocation = TextEditingController();
  // final TextEditingController controllerDisc = TextEditingController();
  // final TextEditingController controllerMinCharge = TextEditingController();
  // final TextEditingController controllerBradName = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey();

  String? healthCertificate, profilePic, frontId, backId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.cubitStatus == CubitStatus.error) {
          showToast(
            ToastMessageStatus.error,
            state.message,
          );
        } else if (state.cubitStatus == CubitStatus.loaded) {
          showToast(ToastMessageStatus.success, state.message);
          Navigator.pushNamed(context, RouteNamedScreens.logiscreen);
        }
      },
      builder: (context, state) {
        final authController = context.read<AuthCubit>();

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
                    controller: authController.controllerName,
                    text: context.name,
                  ),
                  //!======== Phone
                  MainTextFormField(
                    textinputType:
                        const TextInputType.numberWithOptions(decimal: false),
                    validate: (val) => Validate.phoneValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authController.controllerPhone,
                    text: context.phone,
                  ),
                  //!======== location
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authController.controllerLocation,
                    text: context.location,
                  ),
                  //!======== min charge
                  MainTextFormField(
                    textinputType: TextInputType.number,
                    validate: (val) => Validate.minChargeValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authController.controllerMinCharge,
                    text: context.minCharge,
                  ),
                  //!======== discription
                  MainTextFormField(
                    validate: (val) => Validate.discValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authController.controllerDisc,
                    text: context.disc,
                  ),
                  //!======== Brand Name
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authController.controllerBradName,
                    text: context.brandNamed,
                  ),

                  //!======== healthCertificate شهادة صحية
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.healthCertificate,
                    fileFunction: (value) {
                      return healthCertificate = value.path;
                    },
                    isValid: healthCertificate == null,
                  ),
                  //!======== frontId الهوية الأمامية
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.frontId,
                    fileFunction: (value) {
                      return frontId = value.path;
                    },
                    isValid: frontId == null,
                  ),

                  //!======== backId الهوية الخلفية
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.backId,
                    fileFunction: (value) {
                      return backId = value.path;
                    },
                    isValid: backId == null,
                  ),

                  //!======== profilePic صورة الملف الشخصي
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.profilePicture,
                    fileFunction: (value) {
                      return profilePic = value.path;
                    },
                    isValid: profilePic == null,
                  ),

                  //!======== Email
                  MainTextFormField(
                    validate: (val) => Validate.emailValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: authController.controllerEmail,
                    text: context.email,
                  ),
                  //!======== Password
                  CustomTextFormFieldPassword(
                    validate: (val) => Validate.passwordValidate(context, val),
                    horizontal: 24.w,
                    vertical: 12.h,
                    controller: authController.controllerPassword,
                    text: context.password,
                  ),
                  //!======== Confirm Password
                  CustomTextFormFieldPassword(
                    validate: (val) => Validate.confirmPasswordValidate(
                      context,
                      val,
                      authController.controllerPassword.text,
                    ),
                    horizontal: 24.w,
                    vertical: 12.h,
                    controller: authController.controllerConfirmPassword,
                    text: context.confirmPassword,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 64.h,
                    ),
                    child: MainButton(
                      isLoading: state.cubitStatus == CubitStatus.loading,
                      text: context.signUp,
                      onTap: () async {
                        if (formState.currentState!.validate() &&
                            healthCertificate == null &&
                            frontId == null &&
                            backId == null &&
                            profilePic == null) {
                          final RegisterRequestModel registerRequestModel =
                              RegisterRequestModel(
                            name: authController.controllerName.text,
                            phone: authController.controllerPhone.text,
                            email: authController.controllerEmail.text,
                            password: context
                                .read<AuthCubit>()
                                .controllerPassword
                                .text,
                            confirmPassword: context
                                .read<AuthCubit>()
                                .controllerConfirmPassword
                                .text,
                            location: Location(
                              name: "methalfa",
                              address: "meet halfa",
                              coordinates: [1214451511, 12541845],
                            ),
                            minCharge: int.parse(context
                                .read<AuthCubit>()
                                .controllerMinCharge
                                .text),
                            disc: authController.controllerDisc.text,
                            brandName: context
                                .read<AuthCubit>()
                                .controllerBradName
                                .text,
                            backId: backId!,
                            frontId: frontId!,
                            healthCertificate: healthCertificate!,
                            profilePic: profilePic!,
                          );
                          context.read<AuthCubit>().register(
                                registerRequestModel: registerRequestModel,
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
