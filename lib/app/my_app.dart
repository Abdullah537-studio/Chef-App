import 'package:chef_app/app/splashe_page.dart';
import 'package:chef_app/core/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            title: 'Flutter Demo',
            onGenerateRoute: appRouter.onGenerateRoute,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const SplasheScreen(),
          ),
        );
      },
    );
  }
}
