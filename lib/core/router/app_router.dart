import 'package:chef_app/core/injection/injection_container.dart';
import 'package:chef_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:chef_app/features/auth/presentation/pages/create_new_password_page.dart';
import 'package:chef_app/features/auth/presentation/pages/forget_password_page.dart';
import 'package:chef_app/features/auth/presentation/pages/login_page.dart';
import 'package:chef_app/features/auth/presentation/pages/register_page.dart';
import 'package:chef_app/features/profile/presentation/pages/profile_page.dart';
import 'package:chef_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNamedScreens.homescreen:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
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
      case RouteNamedScreens.profilescreen:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case RouteNamedScreens.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordPage());
      case RouteNamedScreens.createNewPassword:
        return MaterialPageRoute(builder: (_) => CreateNewPasswordPage());
    }
    return null;
  }
}

class RouteNamedScreens {
  static const String homescreen = '/home_screen';
  static const String logiscreen = '/login_screen';
  static const String registerscreen = '/register_screen';
  static const String profilescreen = '/profile_screen';
  static const String forgetPassword = '/forget_password';
  static const String createNewPassword = '/create_new_password';
}
