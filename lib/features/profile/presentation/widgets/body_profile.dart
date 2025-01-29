import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/show_alert_dialog.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/image_svg.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/custom_image_edit.dart';
import 'package:chef_app/core/widgets/main_loading_indicator.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/profile/domain/entities/request/chef_data_entity.dart';
import 'package:chef_app/features/profile/presentation/cubit/get_profile_cubit/profile_cubit.dart';
import 'package:chef_app/features/profile/presentation/widgets/custom_change_lang_dropdown.dart';
import 'package:chef_app/features/profile/presentation/widgets/custom_setting_profile.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBodyProfile extends StatelessWidget {
  ShowBodyProfile({super.key, required this.image});
  final String? image;
  ChefDataEntity? chef;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.cubitStatus == CubitStatus.loaded) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageWithEdit(
                  image: image,
                  value: (val) {},
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
                    final profileCubit = context.read<ProfileCubit>();

                    Navigator.pushNamed(
                        context, RouteNamedScreens.editScreenProfile,
                        arguments: profileCubit
                        //  RouteSettings(arguments: profileCubit),
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
            ),
          );
        } else {
          return const MainLoadingIndicator();
        }
      },
    );
  }
}
