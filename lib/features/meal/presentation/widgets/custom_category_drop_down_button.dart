import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/widgets/main_drop_down_button.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';

class CustomCategoryDropDownButton extends StatelessWidget {
  final Function(String)? categoryFunction;
  const CustomCategoryDropDownButton({super.key, this.categoryFunction});
  @override
  Widget build(BuildContext context) {
    List<String> category = ["vagitable", "meat", "another"];
    List<DropdownMenuItem<String>> items = category.map((category) {
      return DropdownMenuItem(
        value: category,
        child: MainTextWidget(text: category, textStyle: regularStyle()),
      );
    }).toList();

    return MainDropdownButtonFormField(
      items: items,
      label: "Category",
      onChanged: (val) {
        categoryFunction!(val ?? "");
      },
    );
  }
}
