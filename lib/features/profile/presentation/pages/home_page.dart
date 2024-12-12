import 'package:chef_app/core/cubits/cubit/bootom_navbar_cubit.dart';
import 'package:chef_app/core/enum/bootm_nav_bar_profile_meal_enum.dart';
import 'package:chef_app/features/profile/presentation/widgets/body_meal.dart';
import 'package:chef_app/features/profile/presentation/widgets/body_profile.dart';
import 'package:chef_app/features/profile/presentation/widgets/custom_bottom_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BootomNavbarCubit, BootomNavbarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CoustomBottomNavigationBar(
            bootmNavBarProfileMealEnum: state.bootmNavBarProfileMealEnum,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 74.h,
            ),
            child: state.bootmNavBarProfileMealEnum ==
                    BootmNavBarProfileMealEnum.meal
                ? showBodyMeal()
                : showBodyProfile(),
          ),
        );
      },
    );
  }
}
