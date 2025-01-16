import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:chef_app/core/strings/constant_string.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomChangeLangDropdown extends StatefulWidget {
  const CustomChangeLangDropdown({
    super.key,
  });

  @override
  _CustomChangeLangDropdownState createState() =>
      _CustomChangeLangDropdownState();
}

class _CustomChangeLangDropdownState extends State<CustomChangeLangDropdown> {
  String? selectedLanguage;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedLanguage = context.locale.languageCode;
  }

  // void _updateLanguage(String languageCode) {
  //   selectedLanguage = languageCode;
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     context.setLocale(Locale(languageCode));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MainTextWidget(
          text: context.chooseLanguage,
          textStyle: boldStyle(color: AppColors.blackColor),
        ),
        DropdownButton<String>(
          value: selectedLanguage,
          onChanged: (String? newValue) {
            setState(() {
              selectedLanguage = newValue;
            });
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.setLocale(Locale(selectedLanguage ?? "en"));
            });
          },
          items: <String>[AppConstantString.ar, AppConstantString.en]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: MainTextWidget(
                text: value == "ar" ? 'العربية' : 'English',
                textStyle: regularStyle(color: AppColors.blackColor),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
