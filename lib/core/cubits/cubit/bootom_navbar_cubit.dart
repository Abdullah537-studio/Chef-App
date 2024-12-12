import 'package:bloc/bloc.dart';
import 'package:chef_app/core/enum/bootm_nav_bar_profile_meal_enum.dart';
import 'package:equatable/equatable.dart';

part 'bootom_navbar_state.dart';

class BootomNavbarCubit extends Cubit<BootomNavbarState> {
  BootomNavbarCubit() : super(BootomNavbarState.initial());
  BootmNavBarProfileMealEnum bootmNavBarProfileMealEnum =
      BootmNavBarProfileMealEnum.profile;
  void changeBootmNavBarProfileMealEnum(bool itsProfile) {
    bootmNavBarProfileMealEnum = itsProfile
        ? BootmNavBarProfileMealEnum.profile
        : BootmNavBarProfileMealEnum.meal;
  }
}
