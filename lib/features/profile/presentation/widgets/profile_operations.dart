import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/features/profile/presentation/widgets/custom_setting_profile.dart';
import 'package:chef_app/core/strings/image_svg.dart';
import 'package:flutter/material.dart';

class ProfileOperations extends StatelessWidget {
  const ProfileOperations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomSettingProfile(
          text: "Edit Profile",
          image: ImageSvg.personIcon,
          ontap: () {
            Navigator.pushNamed(context, RouteNamedScreens.editScreenProfile);
          },
          colorTextIsPrimary: false,
        ),
        CustomSettingProfile(
          text: "Password",
          image: ImageSvg.hidePasswordIcon,
          ontap: () {
            Navigator.pushNamed(
                context, RouteNamedScreens.changePasswordScreenProfile);
          },
          colorTextIsPrimary: false,
        ),
        CustomSettingProfile(
          text: "Settings",
          image: ImageSvg.settingIcon,
          ontap: () {
            Navigator.pushNamed(
                context, RouteNamedScreens.settingScreenProfile);
          },
          colorTextIsPrimary: false,
        ),
        CustomSettingProfile(
          text: "Logout",
          image: ImageSvg.logoutIcon,
          ontap: () {},
          colorTextIsPrimary: true,
        ),
      ],
    );
  }
}
