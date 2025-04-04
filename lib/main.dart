import 'package:chef_app/app/my_app.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/strings/constant_string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/injection/injection_container.dart' as di;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  final CacheHelper cacheHelper = CacheHelper();
  bool? sheckSplacheShowed =
      await cacheHelper.getData(key: AppConstantString.showedSplacheScreen) ==
          "true";
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(AppConstantString.en),
        Locale(AppConstantString.ar),
      ],
      path: "assets/translations",
      fallbackLocale: const Locale(AppConstantString.en),
      child: MyApp(sheckSplacheShowed: sheckSplacheShowed),
    ),
  );
}
// key.tr()
//  change local from button => context.SetLocale(Local("ar"));
