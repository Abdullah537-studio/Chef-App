import 'package:chef_app/app/splashe_page.dart';
import 'package:chef_app/core/function/theme_data_function.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:chef_app/features/auth/presentation/pages/choose_lang_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sheckSplacheShowed});
  final bool? sheckSplacheShowed;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: MaterialApp(
            theme: mainThemeData(),
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            title: 'Chef App',
            onGenerateRoute: AppRouter.onGenerateRoute,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // initialRoute: sheckSplacheShowed
            //     ? RouteNamedScreens.initialRoute
            //     : RouteNamedScreens.chooseLang,
            home: sheckSplacheShowed != null
                ? const SplasheScreen()
                : const ChooseLangPage(),
          ),
        );
      },
    );
  }
}
