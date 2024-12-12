import 'package:bloc/bloc.dart';
import 'package:chef_app/core/enum/bootm_nav_bar_profile_meal_enum.dart';
import 'package:equatable/equatable.dart';

part 'bootom_navbar_state.dart';

class BootomNavbarCubit extends Cubit<BootomNavbarState> {
  BootomNavbarCubit() : super(BootomNavbarState.initial());
  void changeBootmNavBarProfileMealEnum(bool itsProfile) {
    itsProfile
        ? emit(state.copyWith(
            bootmNavBarProfileMealEnum: BootmNavBarProfileMealEnum.profile))
        : emit(state.copyWith(
            bootmNavBarProfileMealEnum: BootmNavBarProfileMealEnum.meal));
  }
}
