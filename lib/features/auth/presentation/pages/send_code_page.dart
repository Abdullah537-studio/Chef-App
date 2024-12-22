import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/function/validate.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/send_code_requist_model.dart';
import 'package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendCodePage extends StatelessWidget {
  SendCodePage({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.cubitStatus == CubitStatus.loaded) {
          showToast(ToastMessageStatus.success, state.message);
          Navigator.pushNamed(
            context,
            RouteNamedScreens.changeForgettonPassword,
          );
        } else if (state.cubitStatus == CubitStatus.error) {
          showToast(ToastMessageStatus.error, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: mainAppBar(context, AppKeyTranslate.forgetPassword),
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
                    text: AppKeyTranslate.sendCodeBody1,
                    textStyle: regularStyle(),
                  ),
                  MainTextWidget(
                    text: AppKeyTranslate.sendCodeBody2,
                    textStyle: regularStyle(),
                  ),
                  MainTextFormField(
                    validate: Validate.emailValidate,
                    horizontal: 0,
                    vertical: 30.h,
                    text: AppKeyTranslate.email,
                    onChanged: (value) {},
                    controller: controller,
                  ),
                  MainButton(
                    text: AppKeyTranslate.sendCode,
                    onTap: () {
                      SendCodeRequistModel sendCode =
                          SendCodeRequistModel(email: controller.text);
                      context
                          .read<AuthCubit>()
                          .sendCodeUsecase(sendCodeRequistModel: sendCode);
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
        );
      },
    );
  }
}
