import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/show_alert_dialog.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/image_svg.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_loading_indicator.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:chef_app/features/profile/presentation/widgets/custom_change_lang_dropdown.dart';
import 'package:chef_app/features/profile/presentation/widgets/custom_setting_profile.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/image_png.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBodyProfile extends StatelessWidget {
  const ShowBodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.cubitStatus == CubitStatus.loaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 113.h,
                    width: 100.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(56.5.r),
                      child: Image.network(
                        state.chef.profilePic ?? "",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(ImageString.editeImageProfile),
                  ),
                ],
              ),
              MainTextWidget(
                  text: state.chef.name ?? "**********",
                  textStyle: boldStyle(color: AppColors.blackColor)),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h, top: 14.h),
                child: MainTextWidget(
                  text: state.chef.email ?? "**********",
                  textStyle: regularStyle(),
                ),
              ),
              const CustomChangeLangDropdown(),
              CustomSettingProfile(
                text: context.editProfile,
                image: ImageSvg.personIcon,
                ontap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.editScreenProfile,
                  );
                },
                colorTextIsPrimary: false,
              ),
              CustomSettingProfile(
                text: context.password,
                image: ImageSvg.hidePasswordIcon,
                ontap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.changePasswordScreenProfile,
                  );
                },
                colorTextIsPrimary: false,
              ),
              CustomSettingProfile(
                text: context.logOut,
                image: ImageSvg.logoutIcon,
                ontap: () {
                  showAlertDialog(
                    context: context,
                    body: context.bodyDialog,
                    title: context.warning,
                  );
                },
                colorTextIsPrimary: true,
              ),
            ],
          );
        } else {
          return const MainLoadingIndicator();
        }
      },
    );
  }
}
