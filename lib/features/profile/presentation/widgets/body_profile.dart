import 'package:chef_app/core/enum/cubit_status.dart';
import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/function/show_alert_dialog.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/image_svg.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/custom_show_image_profile.dart';
import 'package:chef_app/core/widgets/main_loading_indicator.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/profile/domain/entities/request/chef_data_entity.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:chef_app/features/profile/presentation/widgets/custom_setting_profile.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBodyProfile extends StatelessWidget {
  const ShowBodyProfile({super.key, required this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.cubitStatus == CubitStatus.loaded) {
          Chef chefData = state.chef;

          final editProfieRequest = EditProfileRequest(
            brandName: chefData.brandName,
            disc: chefData.disc,
            location: chefData.location,
            minCharge: chefData.minCharge,
            name: chefData.name,
            phone: chefData.phone,
            profilePicUrl: chefData.profilePic,
          );
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomShowImageProfile(
                imageNetwork: image,
              ),
              MainTextWidget(
                  text: chefData.name ?? "**********",
                  textStyle: boldStyle(color: AppColors.blackColor)),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h, top: 14.h),
                child: MainTextWidget(
                  text: chefData.email ?? "**********",
                  textStyle: regularStyle(),
                ),
              ),
              CustomSettingProfile(
                text: context.chooseLanguage,
                image: ImageSvg.settingIcon,
                ontap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.settingScreenProfile,
                  );
                },
                colorTextIsPrimary: false,
              ), // const CustomChangeLangDropdown(),
              CustomSettingProfile(
                text: context.editProfile,
                image: ImageSvg.personIcon,
                ontap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.editScreenProfile,
                    arguments: editProfieRequest,
                  ).then(
                    (result) {
                      if (result == true) {
                        context.read<ProfileCubit>().getChefData();
                      }
                    },
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
