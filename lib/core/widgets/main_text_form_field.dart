import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField({
    super.key,
    required this.text,
    this.onChanged,
    this.controller,
    required this.vertical,
    required this.horizontal,
    required this.validate,
    this.textinputType,
  });
  final String text;
  final double vertical;
  final double horizontal;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? textinputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: TextFormField(
        keyboardType: textinputType,
        validator: validate,
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        cursorErrorColor: AppColors.redColor,
        decoration: InputDecoration(
          hoverColor: Colors.black,
          focusColor: Colors.black,
          fillColor: Colors.black,
          hintText: text,
        ),
      ),
    );
  }
}
