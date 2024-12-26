import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
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
          text: AppKeyTranslate.editProfile,
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
          text: AppKeyTranslate.password,
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
          text: AppKeyTranslate.settings,
          image: ImageSvg.settingIcon,
          ontap: () {
            Navigator.pushNamed(
              context,
              RouteNamedScreens.settingScreenProfile,
            );
          },
          colorTextIsPrimary: false,
        ),
        CustomSettingProfile(
          text: AppKeyTranslate.logOut,
          image: ImageSvg.logoutIcon,
          ontap: () {},
          colorTextIsPrimary: true,
        ),
      ],
    );
  }
}
