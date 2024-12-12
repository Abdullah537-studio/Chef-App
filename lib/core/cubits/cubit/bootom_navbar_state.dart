part of 'bootom_navbar_cubit.dart';

class BootomNavbarState extends Equatable {
  const BootomNavbarState({required this.bootmNavBarProfileMealEnum});
  final BootmNavBarProfileMealEnum bootmNavBarProfileMealEnum;
  factory BootomNavbarState.initial() {
    return const BootomNavbarState(
        bootmNavBarProfileMealEnum: BootmNavBarProfileMealEnum.profile);
  }
  @override
  bool get stringify => true;
  @override
  List<Object> get props => [bootmNavBarProfileMealEnum];
  BootomNavbarState copyWith(
      {BootmNavBarProfileMealEnum? bootmNavBarProfileMealEnum}) {
    return BootomNavbarState(
        bootmNavBarProfileMealEnum:
            bootmNavBarProfileMealEnum ?? this.bootmNavBarProfileMealEnum);
  }
}
