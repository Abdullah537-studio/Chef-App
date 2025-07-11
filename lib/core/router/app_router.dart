import 'package:chef_app/app/splashe_page.dart';
import 'package:chef_app/core/cubits/cubit/bootom_navbar_cubit.dart';
import 'package:chef_app/core/injection/injection_container.dart';
import 'package:chef_app/core/on_boarding_screen/on_boarding_screen.dart';
import 'package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:chef_app/features/auth/presentation/pages/choose_lang_page.dart';
import 'package:chef_app/features/auth/presentation/pages/create_new_password_page.dart';
import 'package:chef_app/features/auth/presentation/pages/send_code_page.dart';
import 'package:chef_app/features/auth/presentation/pages/login_page.dart';
import 'package:chef_app/features/auth/presentation/pages/register_page.dart';
import 'package:chef_app/features/meal/presentation/cubits/cubit/meal_cubit.dart';
import 'package:chef_app/features/meal/presentation/pages/add_meal_page.dart';
import 'package:chef_app/features/profile/domain/entities/request/edit_profile_request.dart';
import 'package:chef_app/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:chef_app/features/profile/presentation/pages/change_password_page.dart';
import 'package:chef_app/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:chef_app/features/profile/presentation/pages/home_page.dart';
import 'package:chef_app/features/profile/presentation/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNamedScreens.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplasheScreen());
      case RouteNamedScreens.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case RouteNamedScreens.chooseLang:
        return MaterialPageRoute(
          builder: (_) => const ChooseLangPage(),
        );
      case RouteNamedScreens.homescreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<ProfileCubit>()..getChefData(),
              ),
              BlocProvider(
                create: (context) => sl<MealCubit>()..getMealsData(),
              ),
              BlocProvider(
                create: (context) => sl<BootomNavbarCubit>(),
              ),
            ],
            child: const HomePage(),
          ),
        );

      case RouteNamedScreens.logiscreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: LoginPage(),
          ),
        );
      case RouteNamedScreens.registerscreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: RegisterPage(),
          ),
        );
      case RouteNamedScreens.sendCode:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<AuthCubit>(),
                  child: SendCodePage(),
                ));
      case RouteNamedScreens.changeForgettonPassword:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<ProfileCubit>(),
                  child: ChangeForgettonPassword(),
                ));
      case RouteNamedScreens.settingScreenProfile:
        return MaterialPageRoute(builder: (_) => const SettingPage());

      case RouteNamedScreens.editScreenProfile:
        final args = settings.arguments;
        if (args is EditProfileRequest) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => sl<ProfileCubit>(),
              child: EditProfilePage(
                profileCubit: args,
              ),
            ),
          );
        } else {
          break;
        }
      case RouteNamedScreens.changePasswordScreenProfile:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<ProfileCubit>(),
                  child: ChangePasswordPage(),
                ));
      case RouteNamedScreens.addMealScreen:
        return MaterialPageRoute(builder: (_) => AddMealPage());
    }
    return null;
  }
}

class RouteNamedScreens {
  static const String initialRoute = '/';
  static const String onBoardingScreen = '/on_boarding_screen';
  static const String homescreen = '/home_screen';
  static const String chooseLang = '/choose_lang';
  static const String logiscreen = '/login_screen';
  static const String registerscreen = '/register_screen';
  static const String forgetPassword = '/forget_password';
  static const String sendCode = '/send_code';
  static const String changeForgettonPassword = '/change_forgetton_password';
  static const String settingScreenProfile = '/setting_screen_profile';
  static const String editScreenProfile = '/edit_screen_profile';
  static const String changePasswordScreenProfile =
      '/change_password_screen_profile';
  static const String addMealScreen = '/addMeal_screen';
}
