import 'package:chef_app/features/profile/presentation/widgets/custom_setting_profile.dart';
import 'package:chef_app/strings/image_svg.dart';
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
          ontap: () {},
        ),
        CustomSettingProfile(
          text: "Password",
          image: ImageSvg.hidePasswordIcon,
          ontap: () {},
        ),
        CustomSettingProfile(
          text: "Settings",
          image: ImageSvg.settingIcon,
          ontap: () {},
        ),
        CustomSettingProfile(
          text: "Logout",
          image: ImageSvg.logoutIcon,
          ontap: () {},
        ),
      ],
    );
  }
}
