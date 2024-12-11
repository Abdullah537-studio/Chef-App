import 'package:chef_app/app/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/injection/injection_container.dart' as di;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("ar")],
      path: "assets/translations",
      fallbackLocale: const Locale("en"),
      child: const MyApp(),
    ),
  );
}
// key.tr()
//  change local from button => context.SetLocale(Local("ar"));