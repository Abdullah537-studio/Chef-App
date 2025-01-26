import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/image_svg.dart';
import 'package:chef_app/core/strings/key_tanslate.dart';
import 'package:chef_app/core/widgets/main_drop_down_button.dart';
import 'package:chef_app/core/widgets/main_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCategoryDropDownButton extends StatefulWidget {
  const CustomCategoryDropDownButton(
      {super.key, this.categoryFunction = _defaultCategoryFunction});
  final Function(String?) categoryFunction;
  static void _defaultCategoryFunction(String? value) {}
  @override
  _CustomCategoryDropDownButtonState createState() =>
      _CustomCategoryDropDownButtonState();
}

class _CustomCategoryDropDownButtonState
    extends State<CustomCategoryDropDownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    List<String> category = [
      "Vegetarian",
      "Vegan",
      "Meat",
      "Seafood",
      "Poultry",
      "Desserts",
      "Appetizers",
      "Salads",
      "Soups",
      "Beverages",
    ];
    List<DropdownMenuItem<String>> items = category.map((category) {
      return DropdownMenuItem(
        value: category,
        child: MainTextWidget(text: category, textStyle: regularStyle()),
      );
    }).toList();

    return MainDropdownButtonFormField<String>(
      itemHeight: 50,
      icon: SvgPicture.asset(ImageSvg.arrowIconDropDownButton),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      items: items,
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.categoryFunction(value);
      },
      hint: context.category,
      validator: (value) {
        if (value == null) {
          return "Please select an option";
        }
        return null;
      },
    );
  }
}
