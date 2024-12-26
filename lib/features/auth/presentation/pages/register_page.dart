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
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerLocation = TextEditingController();
  final TextEditingController controllerDisc = TextEditingController();
  final TextEditingController controllerMinCharge = TextEditingController();
  final TextEditingController controllerBradName = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey();
  final RegisterRequiestModel registerRequiestModel = RegisterRequiestModel();
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
                    onChanged: (value) {},
                  ),
                  //! Phone
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerPhone,
                    text: context.phone,
                    onChanged: (value) {},
                  ),
                  //! location
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerLocation,
                    text: context.location,
                    onChanged: (value) {},
                  ),
                  //! min charge
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerMinCharge,
                    text: context.minCharge,
                    onChanged: (value) {},
                  ),
                  //! discription
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerDisc,
                    text: context.disc,
                    onChanged: (value) {},
                  ),
                  //! Brand Name
                  MainTextFormField(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerBradName,
                    text: context.brandNamed,
                    onChanged: (value) {},
                  ),

                  //! healthCertificate شهادة صحية
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.healthCertificate,
                    file: (value) {
                      return registerRequiestModel.healthCertificate = value;
                    },
                  ),
                  //! frontId الهوية الأمامية
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.frontId,
                    file: (value) {
                      return registerRequiestModel.frontId = value;
                    },
                  ),

                  //! backId الهوية الخلفية
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.backId,
                    file: (value) {
                      return registerRequiestModel.backId = value;
                    },
                  ),

                  //! profilePic صورة الملف الشخصي
                  CustomUploadeImageRegister(
                    horizontal: 26.w,
                    vertical: 14.h,
                    text: context.profilePicture,
                    file: (value) {
                      return registerRequiestModel.profilePic = value;
                    },
                  ),

                  //! Email
                  MainTextFormField(
                    validate: (val) => Validate.emailValidate(context, val),
                    horizontal: 26.w,
                    vertical: 14.h,
                    controller: controllerEmail,
                    text: context.email,
                    onChanged: (value) {},
                  ),
                  //! Password
                  CustomTextFormFieldPassword(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 24.w,
                    vertical: 12.h,
                    controller: controllerPassword,
                    text: context.password,
                    onChanged: (value) {},
                  ),
                  //! Confirm Password
                  CustomTextFormFieldPassword(
                    validate: (val) => Validate.generalValidate(context, val),
                    horizontal: 24.w,
                    vertical: 12.h,
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
                      isLoading: state.cubitStatus == CubitStatus.loading,
                      text: context.signUp,
                      onTap: () {
                        if (formState.currentState?.validate() ?? false) {
                          registerRequiestModel.name = controllerName.text;
                          registerRequiestModel.phone = controllerPhone.text;
                          registerRequiestModel.email = controllerEmail.text;
                          registerRequiestModel.password =
                              controllerPassword.text;
                          registerRequiestModel.confirmPassword =
                              controllerConfirmPassword.text;
                          registerRequiestModel.location =
                              controllerLocation.text;
                          registerRequiestModel.minCharge =
                              controllerMinCharge.text;
                          registerRequiestModel.brandName =
                              controllerBradName.text;
                          registerRequiestModel.disc = controllerDisc.text;

                          context.read<RegisterCubit>().register(
                                registerRequiestModel: registerRequiestModel,
                              );
                        }
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
                            context, RouteNamedScreens.logiscreen);
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
