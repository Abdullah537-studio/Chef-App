import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/constant_string.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_app_bar.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:chef_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? selectedLanguage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedLanguage = context.locale.languageCode;
  }

  void _updateLanguage(String languageCode) {
    setState(() {
      selectedLanguage = languageCode;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.setLocale(Locale(languageCode));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, context.settings),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MainTextWidget(
                    text: context.chooseLanguage,
                    textStyle: regularStyle(),
                  ),
                  DropdownButton<String>(
                    value: selectedLanguage,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        _updateLanguage(newValue);
                        context.read<ProfileCubit>().getChefData();
                        // context
                        //     .read<BootomNavbarCubit>()
                        //     .changeBootmNavBarProfileMealEnum(true);
                      }
                    },
                    items: <String>[AppConstantString.ar, AppConstantString.en]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: MainTextWidget(
                          text: value == AppConstantString.ar
                              ? 'العربية'
                              : 'English',
                          textStyle: regularStyle(),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
