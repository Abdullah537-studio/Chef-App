import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/register_requist_model.dart';
import 'package:chef_app/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/register/register_state.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_ask_login_or_register.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_text_form_field_password.dart';
import 'package:chef_app/features/auth/presentation/widgets/custom_uploade_image_register.dart';
import 'package:chef_app/features/auth/presentation/widgets/cuton_welcome_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerLocation = TextEditingController();
  final TextEditingController controllerDisc = TextEditingController();
  final TextEditingController controllerMinCharge = TextEditingController();
  final TextEditingController controllerBradName = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey();

  String? healthCertificate, profilePic, frontId, backId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
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
                  //! Name
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerName,
                    text: context.name,
                  ),
                  //! Phone
                  MainTextFormField(
                    textinputType:
                        const TextInputType.numberWithOptions(decimal: false),
                    validate: (val) => Validate.phoneValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerPhone,
                    text: context.phone,
                  ),
                  //! location
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerLocation,
                    text: context.location,
                  ),
                  //! min charge
                  MainTextFormField(
                    textinputType: TextInputType.number,
                    validate: (val) => Validate.minChargeValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerMinCharge,
                    text: context.minCharge,
                  ),
                  //! discription
                  MainTextFormField(
                    validate: (val) => Validate.discValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerDisc,
                    text: context.disc,
                  ),
                  //! Brand Name
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerBradName,
                    text: context.brandNamed,
                  ),

                  //! healthCertificate شهادة صحية
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.healthCertificate,
                    fileFunction: (value) {
                      return healthCertificate = value.path;
                    },
                    isValid: healthCertificate == null,
                  ),
                  //! frontId الهوية الأمامية
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.frontId,
                    fileFunction: (value) {
                      return frontId = value.path;
                    },
                    isValid: frontId == null,
                  ),

                  //! backId الهوية الخلفية
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.backId,
                    fileFunction: (value) {
                      return backId = value.path;
                    },
                    isValid: backId == null,
                  ),

                  //! profilePic صورة الملف الشخصي
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.profilePicture,
                    fileFunction: (value) {
                      return profilePic = value.path;
                    },
                    isValid: profilePic == null,
                  ),

                  //! Email
                  MainTextFormField(
                    validate: (val) => Validate.emailValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerEmail,
                    text: context.email,
                  ),
                  //! Password
                  CustomTextFormFieldPassword(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 24.w,
                    vertical: 12.h,
                    controller: controllerPassword,
                    text: context.password,
                  ),
                  //! Confirm Password
                  CustomTextFormFieldPassword(
                    validate: (val) => Validate.confirmPasswordValidate(
                        context, val, controllerPassword.text),
                    horizontal: 24.w,
                    vertical: 12.h,
                    controller: controllerConfirmPassword,
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
                            name: controllerName.text,
                            phone: controllerPhone.text,
                            email: controllerEmail.text,
                            password: controllerPassword.text,
                            confirmPassword: controllerConfirmPassword.text,
                            location: Location(
                                name: "methalfa",
                                address: "meet halfa",
                                coordinates: [1214451511, 12541845]),
                            minCharge: int.parse(controllerMinCharge.text),
                            disc: controllerDisc.text,
                            brandName: controllerBradName.text,
                            backId: backId!,
                            frontId: frontId!,
                            healthCertificate: healthCertificate!,
                            profilePic: profilePic!,
                          );
                          context.read<RegisterCubit>().register(
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
