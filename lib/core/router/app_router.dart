import 'package:chef_app/app/splashe_page.dart';
import 'package:chef_app/core/injection/injection_container.dart';
import 'package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:chef_app/features/auth/presentation/pages/choose_lang_page.dart';
import 'package:chef_app/features/auth/presentation/pages/create_new_password_page.dart';
import 'package:chef_app/features/auth/presentation/pages/forget_password_page.dart';
import 'package:chef_app/features/auth/presentation/pages/login_page.dart';
import 'package:chef_app/features/auth/presentation/pages/register_page.dart';
import 'package:chef_app/features/profile/presentation/pages/change_password_page.dart';
import 'package:chef_app/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:chef_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNamedScreens.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplasheScreen());
      case RouteNamedScreens.chooseLang:
        return MaterialPageRoute(
          builder: (_) => const ChooseLangPage(),
        );
      case RouteNamedScreens.profilescreen:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
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
      case RouteNamedScreens.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordPage());
      case RouteNamedScreens.createNewPassword:
        return MaterialPageRoute(builder: (_) => CreateNewPasswordPage());
      case RouteNamedScreens.settingScreenProfile:
      case RouteNamedScreens.editScreenProfile:
        return MaterialPageRoute(builder: (_) => const EditProfilePage());
      case RouteNamedScreens.changePasswordScreenProfile:
        return MaterialPageRoute(builder: (_) => const ChangePasswordPage());
    }
    return null;
  }
}

class RouteNamedScreens {
  static const String initialRoute = '/';
  static const String homescreen = '/home_screen';
  static const String chooseLang = '/choose_lang';
  static const String logiscreen = '/login_screen';
  static const String registerscreen = '/register_screen';
  static const String profilescreen = '/profile_screen';
  static const String forgetPassword = '/forget_password';
  static const String createNewPassword = '/create_new_password';
  static const String settingScreenProfile = '/setting_screen_profile';
  static const String editScreenProfile = '/edit_screen_profile';
  static const String changePasswordScreenProfile =
      '/change_password_screen_profile';
}
