import 'package:chef_app/core/cubits/cubit/bootom_navbar_cubit.dart';
import 'package:chef_app/core/enum/bootm_nav_bar_profile_meal_enum.dart';
import 'package:chef_app/features/profile/presentation/widgets/custom_icon_bootom_nav_bar.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/image_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustomBottomNavigationBar extends StatelessWidget {
  const CoustomBottomNavigationBar(
      {super.key, required this.bootmNavBarProfileMealEnum});
  final BootmNavBarProfileMealEnum bootmNavBarProfileMealEnum;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.whiteColor)),
      height: 85.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomIconBootomNavBar(
            text: "Meal",
            image: ImageSvg.homeIconBottomNavBar,
            color: bootmNavBarProfileMealEnum == BootmNavBarProfileMealEnum.meal
                ? AppColors.primaryColor
                : AppColors.greyColor,
            ontap: () {
              context
                  .read<BootomNavbarCubit>()
                  .changeBootmNavBarProfileMealEnum(false);
            },
          ),
          CustomIconBootomNavBar(
            text: "Profile",
            image: ImageSvg.profileIconBottomNavBar,
            color:
                bootmNavBarProfileMealEnum == BootmNavBarProfileMealEnum.profile
                    ? AppColors.primaryColor
                    : AppColors.greyColor,
            ontap: () {
              context
                  .read<BootomNavbarCubit>()
                  .changeBootmNavBarProfileMealEnum(true);
            },
          ),
        ],
      ),
    );
  }
}
