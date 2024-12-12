import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/extention/tanslate_extention.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/show_toast.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_button.dart';
import 'package:chef_app/core/widgets/main_text_form_field.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/auth/domain/entities/requiest/send_code_requist_model.dart';
import 'package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:chef_app/strings/color_strings.dart';
import 'package:chef_app/strings/image_png.dart';
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
          showToast(state.message, AppColors.greenColor);
          Navigator.pushNamed(
            context,
            RouteNamedScreens.createNewPassword,
          );
        } else if (state.cubitStatus == CubitStatus.error) {
          showToast(state.message, AppColors.redColor);
        }
      },
      builder: (context, state) {
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
                    text: "reset your password",
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
