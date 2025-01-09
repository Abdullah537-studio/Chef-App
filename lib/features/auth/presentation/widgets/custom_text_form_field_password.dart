import 'package:chef_app/core/function/main_text_style.dart';
import 'package:chef_app/core/strings/color_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldPassword extends StatefulWidget {
  const CustomTextFormFieldPassword({
    super.key,
    required this.text,
    required this.onChanged,
    required this.controller,
    required this.horizontal,
    required this.vertical,
    required this.validate,
  });

  final String text;
  final double horizontal;
  final double vertical;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? Function(String?)? validate;

  @override
  State<CustomTextFormFieldPassword> createState() =>
      _CustomTextFormFieldPasswordState();
}

class _CustomTextFormFieldPasswordState
    extends State<CustomTextFormFieldPassword> {
  final FocusNode _fieldNode = FocusNode();
  Color iconColor = AppColors.greyColor;

  @override
  void initState() {
    super.initState();

    // إضافة مستمع على FocusNode
    _fieldNode.addListener(_updateIconColor);
  }

  @override
  void dispose() {
    _fieldNode.removeListener(_updateIconColor); // تنظيف المستمع
    _fieldNode.dispose();
    super.dispose();
  }

  void _updateIconColor() {
    setState(() {
      iconColor =
          _fieldNode.hasFocus ? AppColors.primaryColor : AppColors.greyColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontal,
        vertical: widget.vertical,
      ),
      child: TextFormField(
        focusNode: _fieldNode,
        validator: widget.validate,
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: true,
        textInputAction: TextInputAction.next,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: regularStyle(
            color: const Color(0xff9D9FA0),
            fontSize: 16.sp,
          ),
          suffixIcon: Icon(
            Icons.remove_red_eye,
            color: iconColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.redColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.greyColor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
